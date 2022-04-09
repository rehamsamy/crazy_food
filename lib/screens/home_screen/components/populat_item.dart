import 'package:crazy_food/helper/constants.dart';
import 'package:flutter/material.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(color: kBackColor1,borderRadius: BorderRadius.circular(15),
            ),
            child: Center(child: Image.asset('assets/icon/icon.png')),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
