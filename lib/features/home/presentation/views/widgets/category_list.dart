import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/widgets/nav_to.dart';
import 'package:food_app/features/home/presentation/mangers/fetch_appetizer_food_cubit/fetch_appetizer_food_cubit.dart';
import 'package:food_app/features/home/presentation/mangers/fetch_beef_food_cubit/fetch_beef_food_cubit.dart';
import 'package:food_app/features/home/presentation/mangers/fetch_break_fast_food/fetch_break_fast_food_cubit.dart';
import 'package:food_app/features/home/presentation/mangers/fetch_popular_food_cubit/fetch_popular_food_cubit.dart';
import 'package:food_app/features/home/presentation/views/widgets/category_item.dart';
import 'package:food_app/features/home/presentation/views/widgets/food_gird.dart';
import 'package:food_app/models/category_model.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({
    super.key,
  });

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedIndex = 0;
  final List<CategoryModel> categories = [
    CategoryModel(categoryName: "All Dishes", widget: Container()),
    CategoryModel(
      categoryName: 'Most Popular',
      widget: BlocBuilder<FetchPopularFoodCubit, FetchPopularFoodState>(
        builder: (context, state) {
          if (state is FetchPopularFoodSuccess) {
            return FoodGird(
              foodList: state.foodList,
            );
          } else if (state is FetchPopularFoodError) {
            return Text(state.message);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    ),
    CategoryModel(
      categoryName: 'Breakfast',
      widget: BlocBuilder<FetchBreakFastFoodCubit, FetchBreakFastFoodState>(
        builder: (context, state) {
          if (state is FetchBreakFastFoodSuccess) {
            return FoodGird(
              foodList: state.foodList,
            );
          } else if (state is FetchBreakFastFoodFailure) {
            return Text(state.message);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    ),
    CategoryModel(
      categoryName: 'Appetizers',
      widget: BlocBuilder<FetchAppetizerFoodCubit, FetchAppetizerFoodState>(
        builder: (context, state) {
          if (state is FetchAppetizerFoodSuccess) {
            return FoodGird(
              foodList: state.foodList,
            );
          } else if (state is FetchAppetizerFoodError) {
            return Text(state.message);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    ),
    CategoryModel(
      categoryName: 'Beef',
      widget: BlocBuilder<FetchBeefFoodCubit, FetchBeefFoodState>(
        builder: (context, state) {
          if (state is FetchBeefFoodSuccess) {
            return FoodGird(
              foodList: state.foodList,
            );
          } else if (state is FetchBeefFoodError) {
            return Text(state.error);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories
            .map(
              (e) => InkWell(
                onTap: () {
                  if (categories.indexOf(e) != selectedIndex) {
                    setState(() {
                      selectedIndex = categories.indexOf(e);
                      navTo(
                          context,
                          CategoryNavItem(
                            widget: categories[selectedIndex].widget,
                          ));
                      selectedIndex = 0;
                      debugPrint(selectedIndex.toString());
                    });
                  }
                },
                child: CategoryItem(
                  categoryModel: e,
                  isSelected: selectedIndex == categories.indexOf(e),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class CategoryNavItem extends StatelessWidget {
  const CategoryNavItem({super.key, required this.widget});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: widget,
      ),
    );
  }
}
