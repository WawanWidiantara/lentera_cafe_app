import 'package:get/get.dart';

import 'package:lentera_cafe_app/app/modules/home/controllers/notification_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationController>(
      () => NotificationController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
