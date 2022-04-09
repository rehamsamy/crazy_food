import 'package:crazy_food/helper/constants.dart';
import 'package:crazy_food/widgets/app_text.dart';
import 'package:crazy_food/widgets/image_picker_dialog.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          AppText('text')
        ],
      ),
    );
  }
}
