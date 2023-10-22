import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lentera_cafe_app/app/constants/url.dart';
import 'package:lentera_cafe_app/app/data/models/cart_model.dart';
import 'package:lentera_cafe_app/app/modules/admin_transaction/controllers/list_nota_controller.dart';
import 'package:lentera_cafe_app/app/modules/login/controllers/login_controller.dart';
import 'package:lentera_cafe_app/app/modules/profile/controllers/riwayat_controller.dart';

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
    print(idTransaksi);
    try {
      var url = Uri.parse("${UrlApi.baseAPI}orders/${idTransaksi[0]}");
      final response = await http.get(url, headers: {
        'Authorization': 'Token ${loginC.getStorage.read("token")}',
      });
      var result = json.decode(response.body);
      var cart = Cart.fromJson(result);
      detailTransaksi.value = cart.toJson();
      if (detailTransaksi['status'] == 'dikonfirmasi') {
        update();
        isLoading(false);
      } else {
        Get.back();
        isLoading(false);
        // Get.snackbar('Gagal', 'Transaksi belum dikonfirmasi');
      }
      // print(detailTransaksi['order_item']);
      // update();
    } catch (e) {
      isLoading(false);
      Get.back();
      print(e);
    }
  }

  Future konfirmasiOrder() async {
    isLoading(false);
    try {
      var url =
          Uri.parse("${UrlApi.baseAPI}orders/${idTransaksi[0]}/pay_order/");

      await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Token ${loginC.getStorage.read("token")}',
        },
        // body: inputOrder,
      ).then((res) {
        if (res.statusCode == 200) {
          kasir.fetchWaiting();
          kasir.fetchFinish();
          pelanggan.fetchWaiting();
          pelanggan.fetchFinish();
          isLoading(false);
          update();
        } else {
          isLoading(false);
          update();
        }
      });
    } catch (e) {
      isLoading(false);
      throw Exception(e);
    }
  }

  void increment() => count.value++;
}
