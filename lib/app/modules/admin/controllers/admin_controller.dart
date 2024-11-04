// ignore_for_file: unnecessary_overrides

import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:menu_recommendation_app/app/constants/url.dart';
import 'package:menu_recommendation_app/app/modules/admin_transaction/views/admin_detail_nota_view.dart';
import 'package:menu_recommendation_app/app/modules/login/controllers/login_controller.dart';
import 'package:http/http.dart' as http;
import 'package:menu_recommendation_app/app/routes/app_pages.dart';
import 'package:menu_recommendation_app/app/widget/snackbar.dart';

class AdminController extends GetxController {
  final loginC = Get.put(LoginController());
  var user = "".obs;
  var qrCode = ''.obs;
  String scanned = '';

  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    final userData = loginC.getStorage.read('user');
    var nama = userData['full_name'];
    String? namaDepan = nama?.split(' ')[0];
    user.value = namaDepan?.capitalize ?? '';
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

    final response = await http.post(
      url,
      headers: {'Authorization': token},
    );
    if (response.statusCode == 204) {
      loginC.getStorage.write('token', '');
      loginC.getStorage.write('user', '');
      isLoading(false);
      Get.offAllNamed(Routes.LOGIN);
      SnackBarWidget.showSnackBar('Logout Berhasil',
          'Anda telah berhasil keluar ke akun Anda', 'success');
    } else {
      isLoading(false);
      SnackBarWidget.showSnackBar('Gagal keluar dari akun',
          'Error Status Code: ${response.statusCode}', 'err');
    }
  }

  Future<void> scanQR() async {
    try {
      scanned = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if (scanned != "-1") {
        Get.to(const AdminDetailNotaView(), arguments: [scanned, 'menunggu']);
      }
    } on PlatformException {
      Get.snackbar('title', 'message');
    }
  }
}
