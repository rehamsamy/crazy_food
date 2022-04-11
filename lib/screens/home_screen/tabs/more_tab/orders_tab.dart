import 'package:crazy_food/widgets/app_text.dart';
import 'package:flutter/material.dart';

class MoreTab extends StatefulWidget {
  const MoreTab({Key? key}) : super(key: key);

  @override
  State<MoreTab> createState() => _MoreTabState();
}

class _MoreTabState extends State<MoreTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(
        child: AppText(
          'More',
          fontSize: 30,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
