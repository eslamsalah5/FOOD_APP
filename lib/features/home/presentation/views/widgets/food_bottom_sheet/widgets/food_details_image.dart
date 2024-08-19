import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/utils/constants.dart';

class FoodDetailsImage extends StatelessWidget {
  final String foodImage;
  const FoodDetailsImage({
    super.key,
    required this.foodImage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey.shade50,
      shape: const CircleBorder(),
      color: kBackgroundColor,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 1,
      child: Card(
        margin: const EdgeInsets.all(40),
        shape: const CircleBorder(),
        shadowColor: Colors.grey.shade50,
        color: kBackgroundColor,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 2,
        child: CachedNetworkImage(
          imageUrl: foodImage,
          fit: BoxFit.cover,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(
            value: downloadProgress.progress,
          ),
          errorWidget: (context, url, error) =>
              const Icon(Icons.error_outline_outlined),
        ),
      ),
    );
  }
}
