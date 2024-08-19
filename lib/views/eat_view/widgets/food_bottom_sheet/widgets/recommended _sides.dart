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
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(16)),
      width: 327,
      height: 140,
      child: Padding(
        padding: const EdgeInsets.all(10),
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
                    height: 22 / 14,
                  ),
                  textAlign: TextAlign.left,
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
                        height: 16 / 12,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "(120 reviews)",
                      style: TextStyle(
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
                Text(
                  '${recommendedSideModel.price}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff007b2c),
                    height: 20 / 14,
                  ),
                  textAlign: TextAlign.left,
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
                      color: Color(0xFFFF7B2C),
                    )),
                const Text('1'),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_circle,
                      color: Color(0xFFFF7B2C),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
