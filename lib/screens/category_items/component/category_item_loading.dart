import 'package:crazy_food/screens/category_items/component/products_item.dart';
import 'package:crazy_food/screens/home_screen/tabs/home_tab/components/category_item.dart';
import 'package:crazy_food/widgets/shimmer_ui_effect.dart';
import 'package:flutter/material.dart';

class CategoryItemLoading extends StatelessWidget {
  const CategoryItemLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: MyShimmerEffectUI.rectangular(
              height: ProductsItem.height - 10,
            ),
          ),
        ],
      ),
    );
  }
}
