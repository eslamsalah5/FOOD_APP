import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/home/presentation/mangers/fetch_appetizer_food_cubit/fetch_appetizer_food_cubit.dart';
import 'package:food_app/features/home/presentation/mangers/fetch_popular_food_cubit/fetch_popular_food_cubit.dart';
import 'package:food_app/features/home/presentation/views/widgets/foods_list_view.dart';

class MostPopularFoodListViewBlocBuilder extends StatelessWidget {
  const MostPopularFoodListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchPopularFoodCubit, FetchPopularFoodState>(
      builder: (context, state) {
        if (state is FetchPopularFoodSuccess) {
          return FoodsListView(foodList: state.foodList);
        } else if (state is FetchPopularFoodError) {
          return Text(state.message);
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
