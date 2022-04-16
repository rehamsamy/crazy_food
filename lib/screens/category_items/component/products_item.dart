import 'package:crazy_food/helper/constants.dart';
import 'package:crazy_food/widgets/app_cached_image.dart';
import 'package:crazy_food/widgets/app_text.dart';
import 'package:crazy_food/widgets/image_picker_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsItem extends StatefulWidget {
  const ProductsItem({Key? key}) : super(key: key);

  static double height = 200;

  @override
  State<ProductsItem> createState() => _ProductsItemState();
}

class _ProductsItemState extends State<ProductsItem> {
  bool increment=false;
  int quantity=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 0.1,color: Colors.grey)
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 1,
            right: 1,
            top: 1,
            child: Container(
              margin: EdgeInsets.only(top: 15),
              child: AppCashedImage(
              imageUrl: 'https://cdn.britannica.com/27/218927-050-E99E1D46/Lychee-fruit-tree-plant.jpg',
              height: 100,
              width: MediaQuery.of(context).size.width*0.5,
              fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            left: 1,
            bottom: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: AppText('Meat new food', fontSize: 16,fontWeight: FontWeight.bold,),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: AppText('250.00\$',fontSize: 10,color: Colors.grey.shade400,),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: AppText('25\$', color: kPrimaryColor,fontWeight: FontWeight.bold,
                      fontSize: 12,),
                ),
              ],
            ),
          ),
            Positioned(
                bottom: 1,
                right: 1,
                child: Container(
                  width: 30,
                  height: increment?110:30,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),
                  ),
                  child:increment? Center(
                    child: Column(
                      children: [
                        IconButton(onPressed: (){
                          setState(() {
                           quantity==0?quantity=0:
                            quantity--;
                          });
                        }, icon: Icon(Icons.minimize,color: Colors.white,size: 18,)),
                        Center(child: AppText(quantity<10?'0$quantity':'$quantity',color: Colors.white,fontSize: 12,)),
                        IconButton(onPressed: (){
                          setState(() {
                            quantity++;
                          });
                        }, icon: Icon(Icons.add,color: Colors.white,size: 18,)),
                      ],
                    ),
                  ):
                  Center(
                    child: IconButton(onPressed: (){
                      setState(() {
                        increment=true;
                        quantity++;
                      });
                    }, icon: Icon(Icons.add,color: Colors.white,size: 18,)),
                  ),
                  //InkWell(child: AppText('+',color: Colors.white,)),
                ))
      ]
      ),
    );
  }
}
