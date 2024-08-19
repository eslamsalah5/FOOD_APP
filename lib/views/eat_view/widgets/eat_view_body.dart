import 'package:flutter/material.dart';
import 'package:food_app/models/add_eat_model.dart';
import 'package:food_app/views/eat_view/widgets/eat_view_item.dart';

class EatViewBody extends StatefulWidget {
  const EatViewBody({super.key});

  @override
  State<EatViewBody> createState() => _EatViewBodyState();
}

class _EatViewBodyState extends State<EatViewBody> {
  final List<Add_food_Model> Addfood = const [
    Add_food_Model(
        image: "assets/images/food1.png",
        name: "Avocado and Egg Toast",
        price: '\$10.40'),
    Add_food_Model(
        image: "assets/images/food_2.png",
        name: "Mac and Cheese",
        price: '\$41'),
    Add_food_Model(
        image: "assets/images/food_3.png", name: "Power bowl", price: '\$31'),
    Add_food_Model(
        image: "assets/images/food_4.png",
        name: "Mac and Cheese",
        price: '\$51'),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
                child: const Text(
                    'We think you might enjoy these specially selected dishes',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF32324D)))),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const KindOrder(isEat: true, kindName: 'Eat'),
                  const SizedBox(
                    width: 8,
                  ),
                  const KindOrder(isEat: false, kindName: 'Drink'),
                  const SizedBox(
                    width: 8,
                  ),
                  const KindOrder(isEat: false, kindName: 'Dessert'),
                  const SizedBox(
                    width: 18,
                  ),
                  Image.asset(
                    'assets/images/menu.png',
                  )
                ],
              ),
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) =>
                AddFoodItem(Add_food: Addfood[index]),
            itemCount: Addfood.length,
          )
        ],
      ),
    );
  }
}

class KindOrder extends StatelessWidget {
  final bool isEat;
  final String kindName;

  const KindOrder({
    super.key,
    required this.isEat,
    required this.kindName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 44,
      decoration: BoxDecoration(
        color: isEat ? const Color(0xFFFFB01D) : Colors.transparent,
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      child: MaterialButton(
        onPressed: () {},
        child: Text(kindName,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: isEat ? const Color(0xFFFFFFFF) : const Color(0xFF666687),
            )),
      ),
    );
  }
}
