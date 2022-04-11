import 'package:crazy_food/widgets/app_text.dart';
import 'package:flutter/material.dart';

class OrdersTab extends StatefulWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  State<OrdersTab> createState() => _OrdersTabState();
}

class _OrdersTabState extends State<OrdersTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(
        child: AppText(
          'Orders',
          fontSize: 30,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
