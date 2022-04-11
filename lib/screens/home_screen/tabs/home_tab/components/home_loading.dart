import 'package:crazy_food/widgets/shimmer_ui_effect.dart';
import 'package:flutter/material.dart';

class HomeLoading extends StatelessWidget {
  const HomeLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: MyShimmerEffectUI.rectangular(height: 100)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: MyShimmerEffectUI.rectangular(height: 20),
          ),
        ),
      ],
    );
  }
}
