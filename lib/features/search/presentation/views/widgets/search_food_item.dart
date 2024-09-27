
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app/features/home/domin/entities/food_entitie.dart';
import 'package:food_app/features/home/presentation/views/widgets/food_bottom_sheet/food_bottom_sheet.dart';
import 'package:food_app/models/add_topping_model.dart';
import 'package:food_app/models/recommended_side_model.dart';

class SearchFoodItem extends StatefulWidget {
  const SearchFoodItem({
    super.key,
    required this.food,
  });
  final FoodEntitie food;

  @override
  State<SearchFoodItem> createState() => _SearchFoodItemState();
}

class _SearchFoodItemState extends State<SearchFoodItem> {
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

  late TextEditingController addRequestController;

  initState() {
    addRequestController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    addRequestController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _openBottomSheet(context),
      child: Container(
        height: 120,
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: widget.food.foodImage,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 12.0, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      widget.food.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff32324d),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star_half,
                        color: Colors.amber,
                        size: 16,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '${widget.food.Rating.round()}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff8e8ea9),
                        ),
                      ),
                      Text(
                        "(120 reviews)",
                        style: TextStyle(
                          fontFamily: "Mulish",
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffc0c0cf),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 8,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\$',
                        style: TextStyle(
                          color: Color(0xFFFFB080),
                          fontSize: 9,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '${widget.food.price}',
                        style: TextStyle(
                          color: Color(0xFFFF7B2C),
                          fontSize: 16,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w800,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
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
