import 'package:flutter/material.dart';
import 'package:food_app/models/add_topping_model.dart';
import 'package:food_app/models/ingredients_model.dart';
import 'package:food_app/models/recommended_side_model.dart';
import 'package:food_app/shared/constants/constants.dart';
import 'package:food_app/views/eat_view/widgets/food_bottom_sheet/widgets/add_request.dart';
import 'package:food_app/views/eat_view/widgets/food_bottom_sheet/widgets/add_topipng_listview.dart';
import 'package:food_app/views/eat_view/widgets/food_bottom_sheet/widgets/buy_food_button.dart';
import 'package:food_app/views/eat_view/widgets/food_bottom_sheet/widgets/food_details_image.dart';
import 'package:food_app/views/eat_view/widgets/food_bottom_sheet/widgets/food_info.dart';
import 'package:food_app/views/eat_view/widgets/food_bottom_sheet/widgets/ingredients_listview.dart';
import 'package:food_app/views/eat_view/widgets/food_bottom_sheet/widgets/recommended_side_listview.dart';

class FoodBootmSheet extends StatelessWidget {
  const FoodBootmSheet({
    super.key,
    required this.ingredients,
    required this.addTopping,
    required this.recommendedSideModel,
    required this.addRequestController,
  });

  final List<IngredientsModel> ingredients;
  final List<AddToppingModel> addTopping;
  final List<RecommendedSideModel> recommendedSideModel;
  final TextEditingController addRequestController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const FoodDetailsImage(),
                const Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 160,
                          child: Text("Avocado and Egg Toast",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF32324D),
                              )),
                        ),
                        Spacer(),
                        Text(
                          "10.00",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFFFF7B2C),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'You won\'t skip the most important meal of the day with this avocado toast recipe. Crispy, lacy eggs and creamy avocado top hot buttered toast. ',
                      style: TextStyle(
                        fontSize: headLineFont3,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF666687),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 24.0, vertical: 30),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 327,
                    height: 58,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(16),
                        color: Colors.white),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FoodInfo(
                          amount: 400,
                          unit: "kcal",
                        ),
                        FoodInfo(
                          amount: 510,
                          unit: "grams",
                        ),
                        FoodInfo(
                          amount: 30,
                          unit: "proteins",
                        ),
                        FoodInfo(
                          amount: 56,
                          unit: "carbs",
                        ),
                        FoodInfo(
                          amount: 24,
                          unit: "fats",
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ingredients',
                      style: TextStyle(
                        fontSize: headLineFont2,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF666687),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 74,
                      child: IngredientsListView(ingredients: ingredients),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Add toppings',
                      style: TextStyle(
                        fontSize: headLineFont2,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF666687),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    AddToppingListView(addTopping: addTopping),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Recommended sides',
                      style: TextStyle(
                        fontSize: headLineFont2,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF666687),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    RecommendedSideListView(
                        recommendedSideModel: recommendedSideModel)
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                AddRequest(addRequestController: addRequestController),
                const SizedBox(height: 120),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        const BuyFoodButton(),
      ],
    );
  }
}
