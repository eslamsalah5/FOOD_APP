import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/home/presentation/mangers/fetch_beef_food_cubit/fetch_beef_food_cubit.dart';
import 'package:food_app/features/home/presentation/views/widgets/foods_list_view.dart';

class BeefFoodListViewBlocBuilder extends StatelessWidget {
  const BeefFoodListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchBeefFoodCubit, FetchBeefFoodState>(
      builder: (context, state) {
        if (state is FetchBeefFoodSuccess) {
          return FoodsListView(foodList: state.foodList);
        } else if (state is FetchBeefFoodError) {
          return Text(state.error);
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
