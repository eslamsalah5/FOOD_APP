import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/features/home/domin/entities/food_entitie.dart';
import 'package:food_app/features/home/presentation/views/widgets/food_bottom_sheet/food_bottom_sheet.dart';
import 'package:food_app/models/add_topping_model.dart';
import 'package:food_app/models/recommended_side_model.dart';

class GridFoodItem extends StatefulWidget {
  final FoodEntitie food;
  const GridFoodItem({
    super.key,
    required this.food,
  });

  @override
  State<GridFoodItem> createState() => _GridFoodItemState();
}

class _GridFoodItemState extends State<GridFoodItem> {
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
  void dispose() {
    super.dispose();
    addRequestController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _openBottomSheet(context),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 100),
        child: IntrinsicWidth(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x0A323247),
                  blurRadius: 20,
                  offset: Offset(0, 4),
                  spreadRadius: -2,
                ),
                BoxShadow(
                  color: Color(0x070C1A4B),
                  blurRadius: 1,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: widget.food.foodImage,
                      fit: BoxFit.fill,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error_outline_outlined),
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                        child: CircularProgressIndicator(
                          value: downloadProgress.progress,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 8.0,
                    ),
                    child: Text(
                      widget.food.name,
                      style: TextStyle(
                        color: Color(0xFF32324D),
                        fontSize: 14,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 8.0,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '\$',
                          style: TextStyle(
                            color: Color(0xFFFFB080),
                            fontSize: 9,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '${widget.food.price}',
                          style: TextStyle(
                            color: Color(0xFFFF7B2C),
                            fontSize: 16,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
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
            addTopping: addTopping,
            recommendedSideModel: recommendedSideModel,
            addRequestController: addRequestController,
            food: widget.food,
          ),
        );
      },
    );
  }
}
