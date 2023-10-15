import 'package:get/get.dart';

import '../controllers/saw_controller.dart';

class SawBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SawController>(
      () => SawController(),
    );
  }
}
