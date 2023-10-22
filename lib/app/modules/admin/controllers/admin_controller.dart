import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:lentera_cafe_app/app/constants/url.dart';
import 'package:lentera_cafe_app/app/modules/admin_transaction/views/admin_detail_nota_view.dart';
import 'package:lentera_cafe_app/app/modules/login/controllers/login_controller.dart';
import 'package:http/http.dart' as http;
import 'package:lentera_cafe_app/app/routes/app_pages.dart';

class AdminController extends GetxController {
  final loginC = Get.put(LoginController());
  var qrCode = ''.obs;
  String scanned = '';

  RxBool isLoading = false.obs;
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

  kliklogout() async {
    isLoading(true);
    var url = Uri.parse("${UrlApi.baseAPI}account/logout/");
    var token = 'Token ${loginC.getStorage.read("token")}';
    // loginC.getStorage.write("token", '');
    final response = await http.post(
      url,
      headers: {'Authorization': token},
    );
    if (response.statusCode == 204) {
      loginC.getStorage.write('token', '');
      loginC.getStorage.write('user', '');
      isLoading(false);
      Get.offAllNamed(Routes.LOGIN);
      print("Logout Berhasil");
    } else {
      isLoading(false);
      print("Status code: ${response.statusCode}");
    }
  }

  Future<void> scanQR() async {
    try {
      scanned = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      // Get.snackbar('title', scanned);
      // var idOrder = int.parse(scanned);
      Get.to(AdminDetailNotaView(), arguments: [scanned, 'menunggu']);
    } on PlatformException {
      Get.snackbar('title', 'message');
    }
  }
}
