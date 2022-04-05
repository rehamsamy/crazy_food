import 'package:crazy_food/helper/result.dart';
import 'package:crazy_food/helper/shared_methods.dart';
import 'package:crazy_food/widgets/app_dialog.dart';
import 'package:crazy_food/widgets/result_views/error_view.dart';
import 'package:crazy_food/widgets/snack_bar.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  Result result = Result.loading();

  change({required Result result, List<String>? controllerId}) {
    this.result = result;
    controllerId == null ? update() : update(controllerId);
  }

  Future safeCallApi({
    required Function() callBody,
    List<String>? controllerId,
    bool enableLoading = true,
    bool enableErrors = true,
  }) async {
    if (await SharedMethods.checkNetwork()) {
      if (enableLoading) change(result: Result.loading(), controllerId: controllerId);

      try {
        callBody.call();
      } catch (e) {
        Get.log('You got an error $e');
        change(result: Result.error('general_error'.tr), controllerId: controllerId);
        if (enableErrors) {
          showAppDialog(Get.context!, ErrorView(errorMessage: 'general_error'.tr));
        }
      }
    } else {
      Get.log('You Are Offline!!');
      change(result: Result.connectionError());

      if (enableErrors) {
        showSnackBar('network_error'.tr);
      }
    }
  }
}
