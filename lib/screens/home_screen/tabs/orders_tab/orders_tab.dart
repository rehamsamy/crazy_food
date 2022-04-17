import 'package:crazy_food/helper/constants.dart';
import 'package:crazy_food/screens/home_screen/tabs/orders_tab/components/order_item.dart';
import 'package:crazy_food/widgets/app_buttons/app_elevated_button.dart';
import 'package:crazy_food/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersTab extends StatefulWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  State<OrdersTab> createState() => _OrdersTabState();
}

class _OrdersTabState extends State<OrdersTab> with AutomaticKeepAliveClientMixin,TickerProviderStateMixin {
  late TabController _tabController;
  int selectedTabIndex =0;
  @override
  Widget build(BuildContext context) {
    _tabController = TabController(length: 4, vsync: this);
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
                          SizedBox(height: 40,child: TabBar(
                              controller: _tabController,
                              isScrollable: true,
                              indicator:BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10.0,
                                ),
                                color: kPrimaryColor,
                              ),
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.black,
                              onTap: (ind){
                                setState(() {
                                 // selectedTabIndex=ind;
                                });
                              },
                              tabs: [
                                Tab(
                                 text: 'All Order',
                                ),
                                Tab(
                                    text: 'Processing'
                                ),
                                Tab(
                                    text: 'Pending'
                                ),
                                Tab(
                                    text: 'Processing'
                                ),
                                //
                              ],
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                                controller:_tabController,children: [
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
