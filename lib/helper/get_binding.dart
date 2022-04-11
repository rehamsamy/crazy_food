import 'package:crazy_food/controller/home_tab_controller.dart';
import 'package:get/get.dart';


class GetBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeTabController());
  }
}
