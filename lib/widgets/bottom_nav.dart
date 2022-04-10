

import 'package:crazy_food/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
          BottomAppBar(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(icon: Icon(Icons.menu, color: Colors.white,), onPressed: () {},),
                IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: () {},),
                IconButton(icon: Icon(Icons.print, color: Colors.white,), onPressed: () {},),
                IconButton(icon: Icon(Icons.people, color: Colors.white,), onPressed: () {},),
              ],
            ),
            shape: CircularNotchedRectangle(),
            color:kPrimaryColor,
             clipBehavior: Clip.antiAlias,
             notchMargin: 6.0,
          );
  }

  checkBottomColor(int index,BuildContext context){
    return Colors.black;
  }

}