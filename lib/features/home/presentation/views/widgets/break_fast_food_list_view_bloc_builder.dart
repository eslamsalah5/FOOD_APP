import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/home/presentation/mangers/fetch_break_fast_food/fetch_break_fast_food_cubit.dart';
import 'package:food_app/features/home/presentation/views/widgets/foods_list_view.dart';

class BreakFastFoodListViewBlocBuilder extends StatelessWidget {
  const BreakFastFoodListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchBreakFastFoodCubit, FetchBreakFastFoodState>(
      builder: (context, state) {
        if (state is FetchBreakFastFoodSuccess) {
          return FoodsListView(foodList: state.foodList);
        } else if (state is FetchBreakFastFoodFailure) {
          return Text(state.message);
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
