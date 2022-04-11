import 'package:crazy_food/helper/result.dart';

import 'app_controller.dart';

class HomeController extends AppController {
  static String categoriesControllerId = 'categoriesControllerId';

  @override
  onInit() {
    super.onInit();
    _loadData();
  }

  _loadData() async {
    safeCallApi(
      controllerId: [categoriesControllerId],
      callBody: () async {
        result = await Result.success('d');
       // result = await Result.loading();
        change(result: result, controllerId: [categoriesControllerId]);
      },
    );
  }

  Future onRefresh() async {
    _loadData();
  }
}
