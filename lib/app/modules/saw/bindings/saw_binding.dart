import 'package:get/get.dart';

import 'package:lentera_cafe_app/app/modules/saw/controllers/result_saw_controller.dart';

import '../controllers/saw_controller.dart';

class SawBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResultSawController>(
      () => ResultSawController(),
    );
    Get.lazyPut<SawController>(
      () => SawController(),
    );
  }
}
