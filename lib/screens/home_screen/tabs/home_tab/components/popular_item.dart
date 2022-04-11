import 'package:crazy_food/helper/constants.dart';
import 'package:crazy_food/widgets/app_cached_image.dart';
import 'package:flutter/material.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: AppCashedImage(
        radius: 12,
        imageUrl: 'https://cdn.britannica.com/27/218927-050-E99E1D46/Lychee-fruit-tree-plant.jpg',
      ),
    );
  }
}
