import 'package:flutter/material.dart';
import 'package:food_app/models/add_eat_model.dart';
import 'package:food_app/models/add_topping_model.dart';
import 'package:food_app/models/ingredients_model.dart';
import 'package:food_app/models/recommended_side_model.dart';
import 'package:food_app/views/eat_view/widgets/food_bottom_sheet/food_bottom_sheet.dart';

class AddFoodItem extends StatefulWidget {
  final Add_food_Model Add_food;
  const AddFoodItem({
    Key? key, // Fix the super.key parameter
    required this.Add_food,
  });

  @override
  State<AddFoodItem> createState() => _AddFoodItemState();
}

class _AddFoodItemState extends State<AddFoodItem> {
  final List<IngredientsModel> ingredients = const [
    IngredientsModel(image: "assets/images/egg.png", name: "Egg"),
    IngredientsModel(image: "assets/images/avocado.png", name: "Avocado"),
    IngredientsModel(image: "assets/images/salad.png", name: "Salad"),
    IngredientsModel(image: "assets/images/egg.png", name: "Egg"),
    IngredientsModel(image: "assets/images/avocado.png", name: "Avocado"),
    IngredientsModel(image: "assets/images/salad.png", name: "Salad"),
  ];

  final List<AddToppingModel> addTopping = const [
    AddToppingModel(toppingName: "Extra eggs", toppingPrice: 4.20),
    AddToppingModel(toppingName: "Extra spinach", toppingPrice: 2.10),
    AddToppingModel(toppingName: "Extra bread", toppingPrice: 1.30),
    AddToppingModel(toppingName: "Extra tomato", toppingPrice: 5.40),
    AddToppingModel(toppingName: "Extra cucumber", toppingPrice: 3.60),
  ];

  final List<RecommendedSideModel> recommendedSideModel = const [
    RecommendedSideModel(
        image: "assets/images/food1.png",
        name: "Avocado and Egg Toast",
        price: 51),
    RecommendedSideModel(
        image: "assets/images/food_2.png", name: "Mac and Cheese", price: 51),
    RecommendedSideModel(
        image: "assets/images/food_3.png", name: "Power bowl", price: 51),
    RecommendedSideModel(
        image: "assets/images/food_4.png", name: "Mac and Cheese", price: 51),
  ];
  var addRequestController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _openBottomSheet(context); // Open the BottomSheet
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Image(
                  image: AssetImage('${widget.Add_food.image}'),
                  height: 100,
                  width: 100,
                ),
                Column(
                  children: [
                    Text(
                      "${widget.Add_food.name}",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff32324d),
                        height: 22 / 14,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.amber,
                          ),
                        ),
                        Text(
                          "4.9",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff8e8ea9),
                            height: 16 / 12,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "(120 reviews)",
                          style: const TextStyle(
                            fontFamily: "Mulish",
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffc0c0cf),
                            height: 16 / 12,
                          ),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "${widget.Add_food.price}",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff007b2c),
                            height: 20 / 14,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * .88,
          // BottomSheet content
          child: FoodBootmSheet(
              ingredients: ingredients,
              addTopping: addTopping,
              recommendedSideModel: recommendedSideModel,
              addRequestController: addRequestController),
        );
      },
    );
  }
}
