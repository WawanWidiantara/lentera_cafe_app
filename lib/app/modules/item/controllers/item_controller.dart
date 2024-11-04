// ignore_for_file: unnecessary_overrides

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menu_recommendation_app/app/constants/url.dart';
import 'package:menu_recommendation_app/app/data/models/items_model.dart';
import 'package:menu_recommendation_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:menu_recommendation_app/app/modules/login/controllers/login_controller.dart';
import 'package:http/http.dart' as http;
import 'package:menu_recommendation_app/app/widget/snackbar.dart';

class ItemController extends GetxController {
  final loginC = Get.put(LoginController());
  final controller = Get.put(CartController());
  var idItem = Get.arguments;
  var itemDetail = {}.obs;
  RxBool isLoading = false.obs;

  late TextEditingController catatanController;
  final catatan = ''.obs;

  final count = 1.obs;
  @override
  void onInit() {
    super.onInit();
    catatanController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
    fetchItemsDetailData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future fetchItemsDetailData() async {
    try {
      var url = Uri.parse("${UrlApi.baseAPI}items/$idItem/");
      http.get(url, headers: {
        'Authorization': 'Token ${loginC.getStorage.read("token")}',
      }).then((res) {
        if (res.statusCode == 200) {
          var response = json.decode(res.body);
          var item = Items.fromJson(response);
          itemDetail.value = item.toJson();
        } else {
          SnackBarWidget.showSnackBar(
              'Error', 'Error Status Code ${res.statusCode}', 'err');
        }
      });
    } catch (e) {
      SnackBarWidget.showSnackBar('Error', '$e', 'err');
    }
  }

  Future postOrder() async {
    isLoading(false);
    try {
      var url = Uri.parse("${UrlApi.baseAPI}orders/");
      var inputOrder = json.encode({
        "item_id": idItem,
        "jumlah_pesanan": count.value,
        "catatan": catatan.value,
      });
      await http
          .post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Token ${loginC.getStorage.read("token")}',
        },
        body: inputOrder,
      )
          .then((res) {
        if (res.statusCode == 200) {
          controller.fetchCartData();
          isLoading(false);
          update();
          Get.back();
        } else {
          SnackBarWidget.showSnackBar(
              'Error', 'Error Status Code ${res.statusCode}', 'err');
          isLoading(false);
          update();
        }
      });
    } catch (e) {
      SnackBarWidget.showSnackBar('Error', '$e', 'err');
      isLoading(false);
    }
  }

  void decrement() {
    if (count.value > 1) {
      count.value--;
    }
  }

  void increment() => count.value++;

  void insertCatatan(String catatan) {
    this.catatan.value = catatan;
  }
}
