import 'package:crazy_food/helper/result.dart';

import 'app_controller.dart';

class CategoryController extends AppController {
  @override
  onInit() {
    super.onInit();
    _loadData();
  }

  _loadData() async {
    safeCallApi(
      callBody: () async {
        result = await Result.loading();
        await Future.delayed(Duration(seconds: 2));
        result = Result.success(true);
        change(result: result);
      },
    );
  }

  Future onRefresh() async {
    _loadData();
  }
}
