import 'package:crazy_food/controller/home_controller.dart';
import 'package:crazy_food/helper/constants.dart';
import 'package:crazy_food/helper/result.dart';
import 'package:crazy_food/screens/home_screen/tabs/home_tab/components/home_loading.dart';
import 'package:crazy_food/screens/home_screen/tabs/home_tab/components/popular_item.dart';
import 'package:crazy_food/widgets/app_cached_image.dart';
import 'package:crazy_food/widgets/app_text.dart';
import 'package:crazy_food/widgets/app_text_field.dart';
import 'package:crazy_food/widgets/result_views/app_result_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'components/category_item.dart';
import 'components/discount_item.dart';
import 'package:get/get.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with AutomaticKeepAliveClientMixin {
  final TextEditingController searchController = TextEditingController();
  final HomeController homeController = Get.put(HomeController());

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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListTile(title: AppText('Hey',color: Colors.white,),
                    subtitle: AppText('lets search your food.',color: Colors.white,),
                    trailing: AppCashedImage(
                      imageUrl: 'https://img.freepik.com/free-photo/top-view-condiments-aromatic-herbs_1220-435.jpg?t=st=1649609286~exp=1649609886~hmac=29ddbc5648f242fd0af6ec09e2ac4c6ebade2615cbad24c4a32b1ab607c8da59&w=1060',
                      height: 40,
                      width: 40,
                      isCircular: true,
                      fit: BoxFit.contain,
                    ),),
                  ),
                  CustomTextFormField(
                    hintText: 'search'.tr,
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    prefixIcon: Icons.search,
                    prefixIconColor: Colors.grey,
                    radius: 15,
                  ),
                ],
              ),
            ),
        ),
            AppResultHandler(
              appController: homeController,
              showLoading: false,
              child:homeController.result is LoadingResult?HomeLoading():
                  homeController.result is SuccessResult ?
              Container(
                color: kPrimaryColor,
                child: Column(
                  children: [
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ):SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
