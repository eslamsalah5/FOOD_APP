import 'package:flutter/material.dart';
import 'package:food_app/shared/constants/constants.dart';

class BuyFoodButton extends StatelessWidget {
  const BuyFoodButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        width: double.infinity,
        height: 90,
        padding: const EdgeInsetsDirectional.symmetric(
          vertical: 16,
          horizontal: 24,
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.circular(26)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: 90,
              padding: const EdgeInsetsDirectional.symmetric(
                vertical: 15,
                horizontal: 0,
              ),
              decoration: BoxDecoration(
                  color: const Color(0xFFF6F6F9),
                  borderRadius: BorderRadiusDirectional.circular(16)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.remove,
                        color: Color(0xff8E8EA9),
                      )),
                  const Text(
                    '1',
                    style: TextStyle(
                      fontSize: headLineFont3,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF8E8EA9),
                    ),
                  ),
                  IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Color(0xff8E8EA9),
                      )),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 90,
                padding: const EdgeInsetsDirectional.symmetric(
                  vertical: 15,
                  horizontal: 8,
                ),
                decoration: BoxDecoration(
                    color: const Color(0xFF615793),
                    borderRadius: BorderRadiusDirectional.circular(16)),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add to order',
                      style: TextStyle(
                        fontSize: headLineFont2,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    Text(
                      '\$20.00',
                      style: TextStyle(
                        fontSize: headLineFont2,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFFFFFFFF),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
