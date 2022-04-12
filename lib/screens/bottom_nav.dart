import 'package:crazy_food/helper/constants.dart';
import 'package:crazy_food/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
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
              //color: selectedTabIndex == index ? Colors.white : Colors.white38,
              width: 20,
              height: 20,
            ),
            SizedBox(height: 10),
            AppText(
              text,
             // color: selectedTabIndex == index ? Colors.white : Colors.white38,
             // fontSize: selectedTabIndex == index ? 14 : 12,
            ),
          ],
        ),
      ),
    );
  }


  handleIndexChanged(int index) {
   // selectedTabIndex = index;
   // pageController.jumpToPage(index);
   // setState(() {});
  }

}
