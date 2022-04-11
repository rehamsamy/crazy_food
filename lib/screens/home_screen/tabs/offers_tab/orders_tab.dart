import 'package:crazy_food/widgets/app_text.dart';
import 'package:flutter/material.dart';

class OffersTab extends StatefulWidget {
  const OffersTab({Key? key}) : super(key: key);

  @override
  State<OffersTab> createState() => _OffersTabState();
}

class _OffersTabState extends State<OffersTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(
        child: AppText(
          'Offers',
          fontSize: 30,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
