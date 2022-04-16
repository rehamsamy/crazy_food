import 'package:crazy_food/helper/constants.dart';
import 'package:crazy_food/widgets/app_cached_image.dart';
import 'package:crazy_food/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscountItem extends StatelessWidget {
  const DiscountItem({Key? key}) : super(key: key);
  static double height = 150;

  @override
  Widget build(BuildContext context) {
  return  Container(
    height: height,
    margin: EdgeInsets.all(3.0),
    padding: EdgeInsets.all(5.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.pinkAccent.withOpacity(0.1)
    ),
    child: Row(
      children: [
        SizedBox(width: 10,),
        AppCashedImage(
          radius: 12,
          imageUrl:  'https://img.freepik.com/free-photo/top-view-condiments-aromatic-herbs_1220-435.jpg?t=st=1649609286~exp=1649609886~hmac=29ddbc5648f242fd0af6ec09e2ac4c6ebade2615cbad24c4a32b1ab607c8da59&w=1060',
          width: MediaQuery.of(context).size.width * 0.3,
          height: 120,
        ),
        SizedBox(width: 20,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText('30 % DISCOUNT',color: kPrimaryColor,fontWeight: FontWeight.bold,fontSize: 20,),
            SizedBox(height: 10,),
            SizedBox(width:200,child: AppText('order_message'.tr,fontSize: 15,maxLines: 2,textOverflow: TextOverflow.ellipsis,)),
            SizedBox(height: 20,),
            InkWell(child:AppText('order_now'.tr,color: kPrimaryColor,fontSize: 14,fontWeight: FontWeight.bold),onTap: (){},)
          ],
        )
      ],
    ),
  );
  }
}
