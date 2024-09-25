import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/home/presentation/mangers/fetch_appetizer_food_cubit/fetch_appetizer_food_cubit.dart';
import 'package:food_app/features/home/presentation/mangers/fetch_beef_food_cubit/fetch_beef_food_cubit.dart';
import 'package:food_app/features/home/presentation/mangers/fetch_break_fast_food/fetch_break_fast_food_cubit.dart';
import 'package:food_app/features/home/presentation/mangers/fetch_categories_cubit/fetch_categories_cubit.dart';
import 'package:food_app/features/home/presentation/mangers/fetch_popular_food_cubit/fetch_popular_food_cubit.dart';
import 'package:food_app/features/home/presentation/views/widgets/all_dishes.dart';
import 'package:food_app/features/home/presentation/views/widgets/food_gird.dart';

class CategoryTabs extends StatelessWidget {
  const CategoryTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchCategoriesCubit, FetchCategoriesState>(
      builder: (context, state) {
        if (state is FetchCategoriesSuccess) {
          return DefaultTabController(
            length: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabBar(
                  
                    isScrollable: true,
                    labelColor: Colors.white,
                    unselectedLabelColor: Color(0xff666687),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelStyle: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w700,
                    ),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // Creates border
                      color: Color(0xffFFB01D),
                    ),
                    labelPadding: const EdgeInsetsDirectional.only(
                      start: 12,
                      end: 12,
                    ),
                    padding: EdgeInsetsDirectional.only(start: 20),
                    tabAlignment: TabAlignment.center,
                    dividerHeight: 0,
                    tabs: [
                      Tab(
                        text: 'All Dishes',
                      ),
                      Tab(
                        text: 'Most Popular',
                      ),
                      Tab(
                        text: 'Breakfast',
                      ),
                      Tab(
                        text: 'Appetizer and Snacks',
                      ),
                      Tab(
                        text: 'Beef',
                      ),
                    ]),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                      top: 20.0,
                    ),
                    child:
                        TabBarView(physics: BouncingScrollPhysics(), children: [
                      AllDishes(),
                      BlocBuilder<FetchPopularFoodCubit, FetchPopularFoodState>(
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
                      BlocBuilder<FetchBreakFastFoodCubit,
                          FetchBreakFastFoodState>(
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
                      BlocBuilder<FetchAppetizerFoodCubit,
                          FetchAppetizerFoodState>(
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
                      BlocBuilder<FetchBeefFoodCubit, FetchBeefFoodState>(
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
                    ]),
                  ),
                ),
              ],
            ),
          );
        } else if (state is FetchCategoriesError) {
          return Text(state.message);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
