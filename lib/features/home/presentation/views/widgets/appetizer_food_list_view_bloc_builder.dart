import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/home/presentation/mangers/fetch_appetizer_food_cubit/fetch_appetizer_food_cubit.dart';
import 'package:food_app/features/home/presentation/views/widgets/foods_list_view.dart';

class AppetizerFoodListViewBlocBuilder extends StatelessWidget {
  const AppetizerFoodListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchAppetizerFoodCubit, FetchAppetizerFoodState>(
      builder: (context, state) {
        if (state is FetchAppetizerFoodSuccess) {
          return FoodsListView(foodList: state.foodList);
        } else if (state is FetchAppetizerFoodError) {
          return Text(state.message);
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
