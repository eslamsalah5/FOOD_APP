import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/core/utils/assets_name.dart';
import 'package:food_app/features/home/presentation/views/widgets/filter_bottom_sheet/filter_bottom_sheet.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 54,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 4,
            spreadRadius: 4,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            SvgPicture.asset(Assets.imagesSearchIcon),
            SizedBox(
              width: 10,
            ),
            Text(
              'Search',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                _openBottomSheet(context);
              },
              child: SvgPicture.asset(
                Assets.imagesFilterIcon,
              ),
            )
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
          child: FilterBottomSheet(),
        );
      },
    );
  }
}
