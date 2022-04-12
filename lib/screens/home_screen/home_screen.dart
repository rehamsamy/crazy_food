import 'package:crazy_food/helper/constants.dart';
import 'package:crazy_food/screens/home_screen/tabs/home_tab/home_tab.dart';
import 'package:crazy_food/screens/home_screen/tabs/more_tab/orders_tab.dart';
import 'package:crazy_food/screens/home_screen/tabs/offers_tab/orders_tab.dart';
import 'package:crazy_food/screens/home_screen/tabs/orders_tab/orders_tab.dart';
import 'package:crazy_food/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? userScreenIndex;
  late PageController pageController;
  int selectedTabIndex = 0;
  List<Widget> tabs = [];

  @override
  void initState() {
    super.initState();
    // FlutterNativeSplash.remove();
    pageController = PageController(
      initialPage: selectedTabIndex,
      keepPage: true,
    );
    tabs = [
      HomeTab(),
      OrdersTab(),
      OffersTab(),
      MoreTab(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;

    return Scaffold(
      //backgroundColor:Colors.orangeAccent ,
      //color: kPrimaryColor,
      body: PageView(
        controller: pageController,
        // ==>> stop Swipe
        // physics: NeverScrollableScrollPhysics(),
        children: tabs,
        onPageChanged: (selectedPageIndex) {
          handleIndexChanged(selectedPageIndex);
        },
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          child: BottomAppBar(
            shape: CircularNotchedRectangle(),
            color: kPrimaryColor,
            elevation: 10,
            notchMargin: 10.0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                bottomBarItem(
                  svgName: 'category',
                  text: 'Home',
                  index: 0,
                ),
                bottomBarItem(
                  svgName: 'orders',
                  text: 'Orders',
                  index: 1,
                ),
                SizedBox(width: 20),
                bottomBarItem(
                  svgName: 'offers',
                  text: 'Offers',
                  index: 2,
                ),
                bottomBarItem(
                  svgName: 'more',
                  text: 'More',
                  index: 3,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: !showFab
          ? null
          : Container(
              decoration: BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Badge(
                    badgeContent: AppText(
                      '3',
                      color: Colors.white,
                    ),
                    toAnimate: true,
                    position: BadgePosition.topEnd(top: -10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  handleIndexChanged(int index) {
    selectedTabIndex = index;
    pageController.jumpToPage(index);
    setState(() {});
  }

  Widget bottomBarItem({
    required String svgName,
    required String text,
    required int index,
  }) {
    return InkWell(
      onTap: () {
        handleIndexChanged(index);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/icon/$svgName.svg',
              color: selectedTabIndex == index ? Colors.white : Colors.white38,
              width: 20,
              height: 20,
            ),
            SizedBox(height: 10),
            AppText(
              text,
              color: selectedTabIndex == index ? Colors.white : Colors.white38,
              fontSize: selectedTabIndex == index ? 14 : 12,
            ),
          ],
        ),
      ),
    );
  }
}
