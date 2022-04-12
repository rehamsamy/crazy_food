import 'package:crazy_food/controller/category_controller.dart';
import 'package:crazy_food/helper/constants.dart';
import 'package:crazy_food/helper/result.dart';
import 'package:crazy_food/screens/category_screen/components/categoryLoading.dart';
import 'package:crazy_food/screens/home_screen/tabs/home_tab/components/category_item.dart';
import 'package:crazy_food/widgets/app_text.dart';
import 'package:crazy_food/widgets/result_views/app_result_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  final CategoryController categoryController = Get.find();

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
        child: GetBuilder<CategoryController>(
          builder: (_) => AppResultHandler(
            appController: categoryController,
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
                          crossAxisCount: 3,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 0,
                          mainAxisExtent: CategoryItem.height),
                      itemCount: categoryController.result is LoadingResult ? 12 : 20,
                      itemBuilder: (_, index) =>
                          categoryController.result is LoadingResult ? CategoryLoading() : CategoryItem(),
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
