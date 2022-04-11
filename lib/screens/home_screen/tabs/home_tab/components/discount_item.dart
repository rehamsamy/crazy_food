import 'package:crazy_food/helper/constants.dart';
import 'package:crazy_food/widgets/app_cached_image.dart';
import 'package:flutter/material.dart';

class DiscountItem extends StatelessWidget {
  const DiscountItem({Key? key}) : super(key: key);
  static double height = 200;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: AppCashedImage(
        imageUrl:
            'https://img.freepik.com/free-photo/top-view-condiments-aromatic-herbs_1220-435.jpg?t=st=1649609286~exp=1649609886~hmac=29ddbc5648f242fd0af6ec09e2ac4c6ebade2615cbad24c4a32b1ab607c8da59&w=1060',
        radius: 12,
        width: MediaQuery.of(context).size.width * 0.8,
        height: height,
      ),
    );
  }
}
