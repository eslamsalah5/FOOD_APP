import 'package:flutter/material.dart';
import 'package:food_app/models/add_topping_model.dart';
import 'package:food_app/core/utils/constants.dart';

class Addtopping extends StatelessWidget {
  final AddToppingModel addToppingModel;
  const Addtopping({
    super.key,
    required this.addToppingModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 12),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 327,
        height: 58,
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(16),
            color: Colors.white),
        child: Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (value) {},
              side: const BorderSide(color: Colors.grey),
            ),
            Text(
              addToppingModel.toppingName,
              style: const TextStyle(
                fontSize: headLineFont3,
                fontWeight: FontWeight.w500,
                color: Color(0xFF666687),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                const Text(
                  '\$',
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFF7B2C),
                  ),
                ),
                Text(
                  '${addToppingModel.toppingPrice}',
                  style: const TextStyle(
                    fontSize: headLineFont3,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFF7B2C),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
