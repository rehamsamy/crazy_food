import 'package:crazy_food/helper/constants.dart';
import 'package:flutter/material.dart';

class DiscountItem extends StatelessWidget {
  const DiscountItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
          height: 120,
          width: 250,
          decoration: BoxDecoration(
            color: kBackColor1,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(child: Image.asset('assets/icon/icon.png'))),
    );
  }
}
