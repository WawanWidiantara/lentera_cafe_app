import 'package:get/get.dart';

class HomeController extends GetxController {
  var current = 0.obs;
  var test = 'test'.obs;
  List<String> items = [
    "Semua",
    "Makanan",
    "Minuman",
    "Snack",
  ];

  List<String> icons = [
    'assets/icons/icon all item.svg',
    'assets/icons/icon makanan.svg',
    'assets/icons/icon minuman.svg',
    'assets/icons/icon snack.svg',
  ];

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
}
