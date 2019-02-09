#pragma once

#include "ScriptTraits.h"
#include "ScriptTraitTfms.h"

namespace Script
{
	// Derivation of types for script/concrete variable tuples
	template <typename Tuple>
	using script_transform = mph::tuple_type_tfm<iotrait_to_script, Tuple>;

	template <typename Tuple>
	using concrete_transform = mph::tuple_type_tfm<iotrait_to_concrete, Tuple>;

	template <typename OutT, typename InT, typename Tuple>
	using deferred_concrete_transform = mph::tuple_type_tfm<deferred_to_concrete<OutT,InT>::template tfm, Tuple>;


	template <typename Derived, typename ScriptConverter, typename... Layout>
	struct ArgParser
	{
	protected:
		using ArgConvertError = typename ScriptConverter::ArgConvertError;

	public:
		// Argument type layout alias (e.g. std::tuple<OutParam<Image<Deferred>>,...>)
		using ArgLayout = std::tuple<Layout...>;

		// Script argument type layout (e.g. std::tuple<const PyArrayObject*,...>
		using ScriptTypes = typename script_transform<std::tuple<Layout...>>::type;
		using ScriptPtrs = typename mph::tuple_ptr_t<ScriptTypes>;

		// Concrete type layouts (e.g. std::tuple<PyObject*,...>)
		using ArgTypes = typename concrete_transform<std::tuple<Layout...>>::type;
		using ArgPtrs = typename mph::tuple_ptr_t<ArgTypes>;

		// Templated concrete deferred type layout
		template <typename OutT, typename InT>
		using ConcreteArgTypes = typename deferred_concrete_transform<OutT,InT,ArgLayout>::type;

		// Compositeable type selectors
		template <typename... Chain> using S_Arg = compose_selector<ArgLayout, true_pred, Chain...>;
		template <typename... Chain> using S_Out = compose_selector<ArgLayout, is_outparam, Chain...>;
		template <typename... Chain> using S_In = compose_selector<ArgLayout, is_inparam, Chain...>;
		template <typename... Chain> using S_Opt = compose_selector<ArgLayout, is_optparam, Chain...>;
		template <typename... Chain> using S_InOpt = S_Arg<S_In<Chain...>, S_Opt<Chain...>>;

		template <typename... Chain> using S_Image = compose_selector<ArgLayout, is_image, Chain...>;

		template <typename... Chain> using S_Defer = compose_selector<ArgLayout, is_deferred, Chain...>;
		template <typename... Chain> using S_Nondef = compose_selector<ArgLayout, not_deferred, Chain...>;

		// Specific composites selector types
		using OutputSel = typename S_Out<>::selector;
		using InputSel = typename S_In<>::selector;
		using OptionalSel = typename S_Opt<>::selector;
		using DeferredSel = typename S_Defer<>::selector;
		using NondeferredSel = typename S_Nondef<>::selector;
		using NondeferOutSel = typename S_Nondef<S_Out<>>::selector;
		using NondeferInOptSel = typename S_Nondef<S_InOpt<>>::selector;
		using DeferredInOptSel = typename S_Defer<S_InOpt<>>::selector;
		using DeferredInImSel = typename S_Defer<S_In<S_Image<>>>::selector;
		using DeferredOutSel = typename S_Defer<S_Out<>>::selector;

		// Argument layout subsets
		using OutLayout = typename OutputSel::template type<ArgLayout>;
		using InLayout = typename InputSel::template type<ArgLayout>;
		using OptLayout = typename OptionalSel::template type<ArgLayout>;

		// IO-type stripped layout subsets (e.g. OutParam<Image<Deferred>> -> Image<Deferred>)
		using OutTypeLayout = typename mph::tuple_type_tfm<strip_outer, OutLayout>::type;
		using InTypeLayout = typename mph::tuple_type_tfm<strip_outer, InLayout>::type;
		using OptTypeLayout = typename mph::tuple_type_tfm<strip_outer, OptLayout>::type;

		// Optional argument pointers (used for setting defaults)
		using OptPtrs = typename OptionalSel::template type<ArgPtrs>;


	public:
		static constexpr bool has_deferred_image_inputs() noexcept
		{
			return (DeferredInImSel::seq::size() > 0);
		}

		static constexpr bool has_deferred_outputs() noexcept
		{
			return (DeferredOutSel::seq::size() > 0);
		}

		template <typename... T>
		static IdType getInputType(T&&... ioargs)
		{
			// TODO: Stop this from erroring if no deferred inputs
			auto in_defer_tuple = DeferredInImSel::select(std::tuple<T...>(std::forward<T>(ioargs)...));
			return Script::ArrayInfo::getType(std::get<0>(in_defer_tuple));
		}

		static void setOptionalDefaults(ArgPtrs argPtrs)
		{
			Derived::setOptional(OptionalSel::select(argPtrs));
		}

		template <typename OutPtrs, typename InPtrs, typename Selector>
		static void convertSelected(OutPtrs outPtrs, InPtrs inPtrs, Selector)
		{
			// TODO: Potentially pre-check for conversion compatibility
			//  Converters to pass script args to actual non-deferred input types
			convert_arg_subset(outPtrs, inPtrs, typename Selector::seq{});
		}


	public:
		// General argument error exception
		class ArgError: public std::runtime_error
		{
			static std::string make_convert_msg(const ArgConvertError& ace)
			{
				return std::string(Derived::argName(ace.getArgIndex())) + ": " + ace.what();
			}

		public:
			ArgError(const char* msg): std::runtime_error(msg)
			{}

			ArgError(const ArgConvertError& ace): std::runtime_error(make_convert_msg(ace))
			{}

		private:
			ArgError() = delete;
		};

	protected:
		template <typename... Targets, typename... Args, size_t... Is>
		static void convert_arg_subset(std::tuple<Targets*...> targets, std::tuple<Args*...> args, mph::index_sequence<Is...>)
		{
			try
			{
				(void)std::initializer_list<int>
				{
					(ScriptConverter::convertArg((*std::get<Is>(targets)), (*std::get<Is>(args)), static_cast<int>(Is)), void(), 0)...
				};
			}
			catch ( ArgConvertError& ace )
			{
				throw ArgError(ace);
			}
		}
	};
};