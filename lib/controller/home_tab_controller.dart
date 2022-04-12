import 'package:crazy_food/helper/result.dart';

import 'app_controller.dart';

class HomeTabController extends AppController {
  static String bodyControllerId = 'bodyControllerId';
  static String avatarControllerId = 'avatarControllerId';

  @override
  onInit() {
    super.onInit();
    _loadData();
  }

  _loadData() async {
    safeCallApi(
      controllerId: [avatarControllerId, bodyControllerId],
      callBody: () async {
        result = await Result.loading();
        await Future.delayed(Duration(seconds: 2));
        result = Result.success(true);
        change(result: result, controllerId: [avatarControllerId, bodyControllerId]);
      },
    );
  }

  Future onRefresh() async {
    _loadData();
  }
}
