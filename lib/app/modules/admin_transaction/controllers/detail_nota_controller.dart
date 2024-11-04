// ignore_for_file: unnecessary_overrides

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:menu_recommendation_app/app/constants/url.dart';
import 'package:menu_recommendation_app/app/data/models/cart_model.dart';
import 'package:menu_recommendation_app/app/modules/admin_transaction/controllers/list_nota_controller.dart';
import 'package:menu_recommendation_app/app/modules/login/controllers/login_controller.dart';
import 'package:menu_recommendation_app/app/modules/profile/controllers/riwayat_controller.dart';
import 'package:menu_recommendation_app/app/routes/app_pages.dart';
import 'package:menu_recommendation_app/app/widget/snackbar.dart';

class DetailNotaController extends GetxController {
  RxBool isLoading = false.obs;
  final loginC = Get.put(LoginController());
  final kasir = Get.put(ListNotaController());
  final pelanggan = Get.put(RiwayatController());
  var idTransaksi = Get.arguments;
  var detailTransaksi = {}.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchCartData();
  }

  @override
  void onReady() {
    super.onReady();
    fetchCartData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future fetchCartData() async {
    isLoading(false);
    try {
      var url = Uri.parse("${UrlApi.baseAPI}orders/${idTransaksi[0]}");
      final response = await http.get(url, headers: {
        'Authorization': 'Token ${loginC.getStorage.read("token")}',
      });
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        var cart = Cart.fromJson(result);
        detailTransaksi.value = cart.toJson();
        if (detailTransaksi['status'] == 'dikonfirmasi') {
          update();
          isLoading(false);
        } else {
          Get.offAllNamed(Routes.ADMIN);
          SnackBarWidget.showSnackBar(
              'Invalid', 'Data sudahh dikonfirmasi', 'err');
          isLoading(false);
        }
      } else {
        SnackBarWidget.showSnackBar('Error', 'Kode QR tidak falid', 'err');
        Get.offAllNamed(Routes.ADMIN);
        isLoading(false);
      }
    } catch (e) {
      SnackBarWidget.showSnackBar('Error', '$e', 'err');
      Get.back();
      isLoading(false);
    }
  }

  Future konfirmasiOrder() async {
    isLoading(true);
    try {
      var url =
          Uri.parse("${UrlApi.baseAPI}orders/${idTransaksi[0]}/pay_order/");

      await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Token ${loginC.getStorage.read("token")}',
        },
      ).then((res) {
        if (res.statusCode == 200) {
          kasir.fetchWaiting();
          kasir.fetchFinish();
          pelanggan.fetchWaiting();
          pelanggan.fetchFinish();
          isLoading(false);
          update();
          Get.back();
        } else {
          SnackBarWidget.showSnackBar('Gagal mengambil data',
              'Error Status Code: ${res.statusCode}', 'err');
          isLoading(false);
          update();
        }
      });
    } catch (e) {
      SnackBarWidget.showSnackBar('Error', '$e', 'err');
      isLoading(false);
    }
  }

  void increment() => count.value++;
}
