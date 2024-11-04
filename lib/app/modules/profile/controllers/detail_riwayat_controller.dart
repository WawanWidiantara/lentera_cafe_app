// ignore_for_file: unnecessary_overrides

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:menu_recommendation_app/app/constants/url.dart';
import 'package:menu_recommendation_app/app/data/models/cart_model.dart';
import 'package:menu_recommendation_app/app/modules/login/controllers/login_controller.dart';
import 'package:menu_recommendation_app/app/widget/snackbar.dart';

class DetailRiwayatController extends GetxController {
  RxBool isLoading = false.obs;
  final loginC = Get.put(LoginController());
  var idTransaksi = Get.arguments;
  var detailTransaksi = {}.obs;

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
    isLoading(true);
    try {
      var url = Uri.parse("${UrlApi.baseAPI}orders/${idTransaksi[0]}");
      final response = await http.get(url, headers: {
        'Authorization': 'Token ${loginC.getStorage.read("token")}',
      });
      var result = json.decode(response.body);
      var cart = Cart.fromJson(result);
      detailTransaksi.value = cart.toJson();
      update();
      isLoading(false);
    } catch (e) {
      SnackBarWidget.showSnackBar('Error', '$e', 'err');
      isLoading(false);
    }
  }
}
