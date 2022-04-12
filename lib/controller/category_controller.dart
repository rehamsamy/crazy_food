import 'package:crazy_food/helper/result.dart';

import 'app_controller.dart';

class CategoryController extends AppController {
  static String categoryControllerId = 'categoryControllerId';

  @override
  onInit() {
    super.onInit();
    _loadData();
  }

  _loadData() async {
    safeCallApi(
      controllerId: [categoryControllerId],
      callBody: () async {
        // result = await Result.loading();
        result = Result.success('Theme.of(context)');
        change(result: result, controllerId: [categoryControllerId]);
      },
    );
  }

  Future onRefresh() async {
    _loadData();
  }
}
