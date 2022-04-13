import 'package:crazy_food/controller/category_controller.dart';
import 'package:crazy_food/controller/category_item_controller.dart';
import 'package:crazy_food/helper/constants.dart';
import 'package:crazy_food/helper/result.dart';
import 'package:crazy_food/screens/category_screen/components/categoryLoading.dart';
import 'package:crazy_food/screens/home_screen/tabs/home_tab/components/category_item.dart';
import 'package:crazy_food/widgets/app_text.dart';
import 'package:crazy_food/widgets/result_views/app_result_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'component/products_item.dart';

class CategoryItemsScreen extends StatelessWidget {
  final CategoryItemController categoryItemController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          'categories'.tr,
          color: Colors.white,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: kPrimaryColor,
        child: GetBuilder<CategoryItemController>(
          builder: (_) => AppResultHandler(
            appController: categoryItemController,
            showLoading: false,
            child: Container(
              color: kPrimaryColor,
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 18.0),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 8.0,
                    color: Colors.white,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 7,
                          crossAxisSpacing: 7,
                          mainAxisExtent: ProductsItem.height),
                      itemCount: categoryItemController.result is LoadingResult ? 12 : 20,
                      itemBuilder: (_, index) =>
                      categoryItemController.result is LoadingResult ? CategoryLoading() : ProductsItem(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
