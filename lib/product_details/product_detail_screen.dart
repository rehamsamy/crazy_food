import 'package:crazy_food/helper/constants.dart';
import 'package:crazy_food/widgets/app_cached_image.dart';
import 'package:crazy_food/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> with TickerProviderStateMixin{
  int quantity=0;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
       return [
             SliverAppBar(
               expandedHeight: 200,
               floating: true,
               pinned: true,
               snap: true,
               backgroundColor: Colors.white,
               actionsIconTheme: IconThemeData(opacity: 0.0),
               flexibleSpace:AppCashedImage(
                 imageUrl: 'https://cdn.britannica.com/27/218927-050-E99E1D46/Lychee-fruit-tree-plant.jpg',
                 height: 200,
                 fit: BoxFit.cover,
               ),
             ),
       ];
          },
          body: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                right:Radius.circular(20),
                left: Radius.circular(20),
              ),
                  color: Colors.grey.withOpacity(0.4)
            ),
            child: Column(
              children: [
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText('Strawberry', fontWeight: FontWeight.bold,
                        fontSize: 20,),
                        AppText('250.0\$', color: Colors.grey,
                          fontSize: 13,),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AppText('17.20\$', fontSize: 14,),
                            AppText('40 Calarios', fontSize: 14,),
                              RatingBarIndicator(
                                itemCount: 1,
                                itemSize: 27,
                                rating: 1,
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star_border,
                                  color: Colors.amber,
                                ),
                              ),
                            ],
                        ),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: IconButton(onPressed: (){
                                setState(() {
                                  quantity--;
                                });
                              }, icon: Icon(Icons.minimize_outlined,color: Colors.white,size: 18,)),
                            ),
                            SizedBox(width: 15,),
                            AppText('$quantity kg',fontSize: 14,
                            fontWeight: FontWeight.w700,),
                            SizedBox(width: 15,),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: IconButton(onPressed: (){
                                  setState(() {
                                    quantity++;
                                  });
                                }, icon: Icon(Icons.add,color: Colors.white,size: 18,)),
                              ),
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                  child: Column(
                    children: [
                      TabBar(
                        controller: _tabController,
                        labelColor: Colors.black87,
                        unselectedLabelColor: Colors.grey,
                        indicator: BoxDecoration(
                          color: Colors.deepOrange,
                          shape: BoxShape.circle
                        ),
                        //CircleTabIndicator(color: Colors.green, radius: 4),
                        tabs: [
                          new Tab(icon: new Icon(Icons.info), text: "Tab 1"),
                          new Tab(
                              icon: new Icon(Icons.lightbulb_outline),
                              text: "Tab 2"),
                        ],
                      ),
                      Container(
                        height: 200,
                        child: TabBarView(
                            controller: _tabController,
                            children: [
                              Container(
                                  margin: EdgeInsets.all(15),
                                 padding: EdgeInsets.all(15),
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(15),
                                   color: kPrimaryColor
                                 ),
                                 child: Center(child: AppText('to upgrade to a later version! to upgrade to a later version! to upgrade to a later version!'
                                     ' to upgrade to a later version!  to upgrade to a later version!  to upgrade to a later version! ',color: Colors.white,
                                 maxLines: 5,fontSize: 18,),),
                               ),
                              Text('ddddd')
                            ]),
                      ),


                    ],
                  ),

                ),

              ],
            ),

          ),
        ),
      ),
    );

  }
}
