import 'package:crazy_food/helper/constants.dart';
import 'package:crazy_food/screens/home_screen/tabs/orders_tab/components/order_item.dart';
import 'package:crazy_food/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersTab extends StatefulWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  State<OrdersTab> createState() => _OrdersTabState();
}

class _OrdersTabState extends State<OrdersTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: AppText('orders'.tr),
        ),
        body: Container(
          color: kPrimaryColor,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              )
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 8.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child:
                      Column(
                        children: [
                          SizedBox(height: 50,child: AppBar(
                            bottom: TabBar(
                              tabs: [
                                Tab(
                                  icon: Icon(Icons.directions_bike),
                                ),
                                Tab(
                                  icon: Icon(Icons.directions_bike),
                                ),
                                Tab(
                                  icon: Icon(Icons.directions_bike),
                                ),
                                Tab(
                                  icon: Icon(Icons.directions_bike),
                                ),
                                
                              ],
                            ),
                          )),
                          Expanded(
                            child: TabBarView(children: [
                              ListView.builder(itemBuilder: (_,index)=>OrderItem(),itemCount: 10,),
                              AppText(''),
                              AppText(''),
                              AppText(''),
                            ]),
                          ),

                        ],
                      ),
                )
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
