import 'package:crazy_food/helper/constants.dart';
import 'package:crazy_food/screens/home_screen/tabs/home_tab/components/popular_item.dart';
import 'package:crazy_food/widgets/app_cached_image.dart';
import 'package:crazy_food/widgets/app_text.dart';
import 'package:crazy_food/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'components/category_item.dart';
import 'components/discount_item.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with AutomaticKeepAliveClientMixin {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              color: kPrimaryColor,
              child: Column(
                children: [
                  //user avatar here <============>
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextFormField(
                      hintText: 'search'.tr,
                      controller: searchController,
                      keyboardType: TextInputType.text,
                      prefixIcon: Icons.search,
                      prefixIconColor: Colors.grey,
                      radius: 15,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 18.0),
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 8.0,
                            color: Colors.white,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: AppText(
                                    'categories'.tr,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  trailing: AppText(
                                    'see_all'.tr,
                                    color: Colors.black,
                                  ),
                                ),
                                Container(
                                  height: CategoryItem.height,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 10,
                                    itemBuilder: (_, index) => CategoryItem(),
                                    separatorBuilder: (BuildContext context, int index) => SizedBox(width: 3),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: DiscountItem.height,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal, itemCount: 10, itemBuilder: (_, index) => DiscountItem()),
            ),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 8,
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    leading: AppText(
                      'popular'.tr,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    trailing: AppText(
                      'see_all'.tr,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    height: 120,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (_, index) => PopularItem()),
                  )
                ],
              ),
            ),
            SizedBox(height: 50)
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
