import 'package:flutter/material.dart';
import 'package:food_app/features/home/presentation/views/widgets/banner_container.dart';

class BannerContainerListView extends StatelessWidget {
  const BannerContainerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => BannerContainer(),
          separatorBuilder: (context, index) => SizedBox(
                width: 32,
              ),
          itemCount: 10),
    );
  }
}
