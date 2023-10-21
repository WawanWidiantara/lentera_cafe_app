import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lentera_cafe_app/app/constants/url.dart';
import 'package:lentera_cafe_app/app/data/models/cart_model.dart';
import 'package:lentera_cafe_app/app/modules/login/controllers/login_controller.dart';

class DetailRiwayatController extends GetxController {
  RxBool isLoading = false.obs;
  final loginC = Get.put(LoginController());
  var idTransaksi = Get.arguments;
  var detailTransaksi = {}.obs;

  // final count = 0.obs;
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

  // Future fetchDetailTransaksi() async {
  //   try {
  //     print(idTransaksi[0]);
  //     var url = Uri.parse("${UrlApi.baseAPI}orders/${idTransaksi[0]}]");
  //     http.get(url, headers: {
  //       'Authorization': 'Token ${loginC.getStorage.read("token")}',
  //     }).then((res) {
  //       if (res.statusCode == 200) {
  //         var response = json.decode(res.body);
  //         if (response.isEmpty) {
  //           detailTransaksi.value = {};
  //           update();
  //           return detailTransaksi;
  //         } else {
  //           var item = Cart.fromJson(response[0]);
  //           detailTransaksi.value = item.toJson();
  //           update();
  //           return detailTransaksi;
  //         }
  //       } else {
  //         print(res.statusCode);
  //       }
  //     });
  //   } catch (e) {
  //     print(e.toString());
  //     throw Exception(e);
  //   }
  // }

  Future fetchCartData() async {
    isLoading(false);
    print(idTransaksi);
    try {
      // final userData = loginC.getStorage.read('user');
      // final idUser = userData['id'];
      // var url = Uri.parse("${UrlApi.baseAPI}orders/?user=$idUser");
      var url = Uri.parse("${UrlApi.baseAPI}orders/${idTransaksi[0]}");
      final response = await http.get(url, headers: {
        'Authorization': 'Token ${loginC.getStorage.read("token")}',
      });
      var result = json.decode(response.body);
      var cart = Cart.fromJson(result);
      detailTransaksi.value = cart.toJson();
      print(detailTransaksi['order_item'][0]['jumlah_pesanan']);
      update();
      isLoading(false);
    } catch (e) {
      isLoading(false);
      throw Exception(e);
    }
  }

  // void increment() => count.value++;
}
