import 'package:flutter/material.dart';
import 'package:food_app/models/recommended_side_model.dart';

class RecommendedSideItem extends StatelessWidget {
  final RecommendedSideModel recommendedSideModel;
  const RecommendedSideItem({
    super.key,
    required this.recommendedSideModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 140,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
        children: [
          Image(
              image: AssetImage(recommendedSideModel.image),
              height: 100,
              width: 100),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                recommendedSideModel.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff32324d),
                ),
              ),
              const Row(
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
                    "4.9",
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
                    '${recommendedSideModel.price}',
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
          const Spacer(),
          Column(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.remove_circle,
                    color: Color(
                      0xFFFF7B2C,
                    ),
                    size: 30,
                  )),
              const Text('1'),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add_circle,
                  color: Color(0xFFFF7B2C),
                  size: 30,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
