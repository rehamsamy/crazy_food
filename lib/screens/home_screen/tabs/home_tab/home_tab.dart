import 'package:crazy_food/controller/home_tab_controller.dart';
import 'package:crazy_food/helper/constants.dart';
import 'package:crazy_food/helper/result.dart';
import 'package:crazy_food/screens/home_screen/tabs/home_tab/components/home_loading.dart';
import 'package:crazy_food/screens/home_screen/tabs/home_tab/components/popular_item.dart';
import 'package:crazy_food/widgets/app_cached_image.dart';
import 'package:crazy_food/widgets/app_text.dart';
import 'package:crazy_food/widgets/app_text_field.dart';
import 'package:crazy_food/widgets/result_views/app_result_handler.dart';
import 'package:crazy_food/widgets/shimmer_ui_effect.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
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
  final HomeTabController homeTabController = Get.find();

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
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListTile(
                        title: AppText(
                          'Hey',
                          color: Colors.white,
                        ),
                        subtitle: AppText(
                          'lets search your food.',
                          color: Colors.white,
                        ),
                        trailing: GetBuilder<HomeTabController>(
                          id: HomeTabController.avatarControllerId,
                          builder: (_) => homeTabController.result is LoadingResult
                              ? MyShimmerEffectUI.circular(height: 90, width: 90)
                              : AppCashedImage(
                                  imageUrl: userAvatar,
                                  height: 90,
                                  width: 90,
                                  isCircular: true,
                                  fit: BoxFit.contain,
                                ),
                        ),
                      ),
                    ),
                    // change to row of icon and text
                    // on press to search screen
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
            GetBuilder<HomeTabController>(
              id: HomeTabController.bodyControllerId,
              builder: (_) => AppResultHandler(
                appController: homeTabController,
                showLoading: false,
                child: Container(
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
                                    //homeTabController.result is LoadingResult
                                    //  ? ListTileShimmer()
                                    //:
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
                                    homeTabController.result is LoadingResult
                                        ? PlayStoreShimmer(
                                            hasBottomSecondLine: false,
                                            padding: EdgeInsets.zero,
                                          )
                                        : Container(
                                            height: CategoryItem.height,
                                            child: ListView.separated(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: 10,
                                              itemBuilder: (_, index) => CategoryItem(),
                                              separatorBuilder: (BuildContext context, int index) =>
                                                  SizedBox(width: 3),
                                            ),
                                          ),
                                    Container(
                                      height: DiscountItem.height,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              homeTabController.result is LoadingResult ? 6 : 10,
                                          itemBuilder: (_, index) =>
                                              homeTabController.result is LoadingResult
                                                  ? Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(12),
                                                        child: MyShimmerEffectUI.rectangular(
                                                          height: 200,
                                                          width: MediaQuery.of(context).size.width *
                                                              0.8,
                                                        ),
                                                      ),
                                                    )
                                                  : DiscountItem()),
                                    ),
                                    //homeTabController.result is LoadingResult
                                    //  ? ListTileShimmer()
                                    //:
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
                                    homeTabController.result is LoadingResult
                                        ? PlayStoreShimmer(
                                            hasBottomSecondLine: false,
                                            padding: EdgeInsets.zero,
                                          )
                                        : Container(
                                            height: 120,
                                            child: ListView.builder(
                                                scrollDirection: Axis.horizontal,
                                                itemCount: 10,
                                                itemBuilder: (_, index) => PopularItem()),
                                          ),
                                    SizedBox(height: 20)
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
