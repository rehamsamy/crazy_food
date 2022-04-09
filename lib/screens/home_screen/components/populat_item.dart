import 'package:crazy_food/helper/constants.dart';
import 'package:flutter/material.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     
      Padding(
      padding: const EdgeInsets.all(5.0),
      child: ClipRRect(
        child: Image.asset('assets/images/dumy6.jpg'),
        borderRadius: BorderRadius.circular(20),
      ),

    );
  }
}
