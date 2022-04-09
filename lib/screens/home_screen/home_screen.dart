import 'package:crazy_food/screens/home_screen/components/category_item.dart';
import 'package:crazy_food/screens/home_screen/components/discount_item.dart';
import 'package:crazy_food/screens/home_screen/components/populat_item.dart';
import 'package:crazy_food/widgets/app_text.dart';
import 'package:crazy_food/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 100,
          pinned: true,
          floating: false,
          centerTitle: true,
          snap: false,
          flexibleSpace:Column(
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextFormField(hintText: 'search'.tr, controller: searchController,
                  keyboardType: TextInputType.text,prefixIcon: Icons.search,radius: 15,),
              )

            ],
          ) ,
        ),
        SliverList(delegate: SliverChildListDelegate(
          [
            Container(
              width: double.infinity,
              height: 500,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft:Radius.circular(15) )
              ),
              child: Column(
                children: [
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 8,color: Colors.white,
                     child: Column(
                       children: [
                        ListTile(leading: AppText('categories'.tr,fontWeight: FontWeight.bold,color: Colors.black,),trailing:
                          AppText('see_all'.tr,color: Colors.black,),),
                         Container(
                           height: 150,
                           child: ListView.builder(
                           scrollDirection: Axis.horizontal
                               ,itemCount: 10,
                           itemBuilder: (_,index)=>
                              CategoryItem()
                           ),
                         )
                       ],
                     ),
                    ),
                  Container(
                    height: 140,
                    child: ListView.builder(
                       scrollDirection: Axis.horizontal
                       ,itemCount: 10,
                        itemBuilder: (_,index)=>
                            DiscountItem()
                    ),
                  ),
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 8,color: Colors.white,
                    child: Column(
                      children: [
                        ListTile(leading: AppText('popular'.tr,fontWeight: FontWeight.bold,color: Colors.black,),trailing:
                        AppText('see_all'.tr,color: Colors.black,),),
                        Container(
                          height: 120,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal
                              ,itemCount: 10,
                              itemBuilder: (_,index)=>
                                  PopularItem()
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ]
        ))
      ],
    );
  }

}
