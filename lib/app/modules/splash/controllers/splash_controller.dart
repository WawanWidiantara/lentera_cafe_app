import 'package:get/get.dart';
import 'package:lentera_cafe_app/app/routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(Routes.LOGIN);
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
