import 'package:crazy_food/helper/constants.dart';
import 'package:crazy_food/widgets/app_cached_image.dart';
import 'package:crazy_food/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscountItem extends StatelessWidget {
  const DiscountItem({Key? key}) : super(key: key);
  static double height = 200;

  @override
  Widget build(BuildContext context) {
  return  Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          AppCashedImage(
            radius: 12,
            imageUrl:  'https://img.freepik.com/free-photo/top-view-condiments-aromatic-herbs_1220-435.jpg?t=st=1649609286~exp=1649609886~hmac=29ddbc5648f242fd0af6ec09e2ac4c6ebade2615cbad24c4a32b1ab607c8da59&w=1060',
            width: MediaQuery.of(context).size.width * 0.4,
          ),
          SizedBox(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText('30 % DISCOUNT',color: kPrimaryColor,fontWeight: FontWeight.bold,fontSize: 20,),
              SizedBox(height: 10,),
              AppText('order_message'.tr,fontWeight: FontWeight.bold,fontSize: 15,maxLines: 2,),
              SizedBox(height: 20,),
              InkWell(child:AppText('order_now'.tr,color: kPrimaryColor,fontSize: 16,),onTap: (){},)
            ],
          )
        ],
      ),
    );
  }
}
