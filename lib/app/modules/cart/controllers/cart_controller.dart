import 'package:get/get.dart';

class CartController extends GetxController {
  //TODO: Implement CartController

  final count = 1.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void decrement() {
    if (count.value > 1) {
      count.value--;
    }
  }

  void increment() => count.value++;
}
