
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/home/domin/entities/food_entitie.dart';
import 'package:food_app/features/search/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:food_app/features/search/presentation/views/widgets/search_food_list_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchFoodListViewBlocBuilder extends StatelessWidget {
  const SearchFoodListViewBlocBuilder({
    super.key,
    required this.foodList,
  });

  final List<FoodEntitie> foodList;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return Skeletonizer(
            enabled: false,
            child: SearchFoodListView(
              foodList: state.searchedFood,
            ),
          );
        } else if (state is SearchFailure) {
          return Text(state.message);
        } else {
          return Skeletonizer(
            enabled: true,
            child: SearchFoodListView(
              foodList: foodList,
            ),
          );
        }
      },
    );
  }
}

