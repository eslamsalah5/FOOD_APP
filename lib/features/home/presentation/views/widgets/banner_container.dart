import 'package:flutter/material.dart';
import 'package:food_app/core/utils/assets_name.dart';

class BannerContainer extends StatelessWidget {
  const BannerContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Color(0xFF212134),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Product of the day',
                  style: TextStyle(
                    color: Color(0xFFA5A5BA),
                    fontSize: 12,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                SizedBox(
                  width: 148,
                  child: Text(
                    'Avocado Chicken Salad',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      '10.40',
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
          Container(
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 145,
                  height: 145,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.03999999910593033),
                    shape: CircleBorder(),
                  ),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.05999999865889549),
                      shape: CircleBorder(),
                    ),
                    child: Image.asset(Assets.imagesAvocadoSandwich),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
