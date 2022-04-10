import 'package:crazy_food/helper/constants.dart';
import 'package:crazy_food/screens/home_screen/components/category_item.dart';
import 'package:crazy_food/screens/home_screen/components/discount_item.dart';
import 'package:crazy_food/screens/home_screen/components/populat_item.dart';
import 'package:crazy_food/widgets/app_text.dart';
import 'package:crazy_food/widgets/app_text_field.dart';
import 'package:crazy_food/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart';

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
    return  Scaffold(
      //backgroundColor:Colors.orangeAccent ,
      //color: kPrimaryColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 70,
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
               // height: 500,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft:Radius.circular(20) )
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
          )),
        ],
      ),
      bottomNavigationBar: BottomNav(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Stack(
        children :[
          Container(
          width: 60,
          height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle
              ,color: kPrimaryColor
        ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child:  Badge(
                badgeContent: Text('3'),
                toAnimate: true,
                position: BadgePosition.topEnd(),
                child: Icon(Icons.shopping_cart_outlined,color: kPrimaryColor),
              )
              //Icon(Icons.shopping_cart_outlined,color: kPrimaryColor,),
            ),
          ),
        ),

        ]
      )

    );
  }

}
