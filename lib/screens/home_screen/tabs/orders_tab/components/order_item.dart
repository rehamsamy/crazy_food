import 'package:crazy_food/helper/constants.dart';
import 'package:crazy_food/widgets/app_buttons/app_elevated_button.dart';
import 'package:crazy_food/widgets/app_cached_image.dart';
import 'package:crazy_food/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
static double height=140;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
       // border: Border.all(width: 1,color: Colors.grey)
        border: Border(
          bottom: BorderSide(width: 0.2, color: Colors.grey),
        )
      ),
      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AppCashedImage(
            imageUrl: 'https://cdn.britannica.com/27/218927-050-E99E1D46/Lychee-fruit-tree-plant.jpg',
            height: 80,
            width: MediaQuery.of(context).size.width*0.30,
            fit: BoxFit.contain,
          ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: AppText('Meat new food', fontSize: 16,fontWeight: FontWeight.bold,),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: AppText('25\$', color: kPrimaryColor,fontWeight: FontWeight.bold,
              fontSize: 14,),
          ),
          SizedBox(height: 10,),
          AppElevatedButton(text: 'Processing',onPressed: (){},
            backgroundColor: Colors.grey.shade100,textColor: Colors.black,
          )
        ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(),
              AppText('10 Aug,2020',color: Colors.grey,),
            ],
          )
        ],
      ),
    );
  }
}
