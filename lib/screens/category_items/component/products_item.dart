import 'package:crazy_food/helper/constants.dart';
import 'package:crazy_food/widgets/app_cached_image.dart';
import 'package:crazy_food/widgets/app_text.dart';
import 'package:crazy_food/widgets/image_picker_dialog.dart';
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
    return SizedBox(
      height: ProductsItem.height,
      child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: AppCashedImage(
                      imageUrl: 'https://cdn.britannica.com/27/218927-050-E99E1D46/Lychee-fruit-tree-plant.jpg',
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                AppText('Meat new food', maxLines: 1,fontSize: 20,fontWeight: FontWeight.bold,),
                AppText('price', maxLines: 1,fontSize: 16,),
                AppText('25\$', maxLines: 1,color: kPrimaryColor,fontWeight: FontWeight.bold,
                    fontSize: 16,),
              ],
            ),
              Positioned(
                  bottom: 1,
                  right: 1,
                  child: Container(
                    width: 40,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                    ),
                    child:increment? Column(
                      children: [
                        IconButton(onPressed: (){
                          setState(() {
                           quantity==0?quantity=0:
                            quantity--;
                          });
                        }, icon: Icon(Icons.minimize,color: Colors.white,size: 20,)),
                        AppText('$quantity',color: Colors.white,fontSize: 20,),
                        IconButton(onPressed: (){
                          setState(() {
                            quantity++;
                          });
                        }, icon: Icon(Icons.add,color: Colors.white,size: 20,)),
                      ],
                    ):
                    IconButton(onPressed: (){
                      setState(() {
                        increment=true;
                        quantity++;
                      });
                    }, icon: Icon(Icons.add,color: Colors.white,size: 20,)),
                    //InkWell(child: AppText('+',color: Colors.white,)),
                  ))
        ]
        ),
      ),
    );
  }
}
