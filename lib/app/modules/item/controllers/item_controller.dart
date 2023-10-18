import 'dart:convert';

import 'package:get/get.dart';
import 'package:lentera_cafe_app/app/constants/url.dart';
import 'package:lentera_cafe_app/app/data/models/items_model.dart';
import 'package:lentera_cafe_app/app/modules/login/controllers/login_controller.dart';
import 'package:http/http.dart' as http;

class ItemController extends GetxController {
  final loginC = Get.put(LoginController());
  var idItem = Get.arguments;
  var itemDetail = {}.obs;

  final count = 1.obs;
  @override
  void onInit() {
    super.onInit();
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
          print(itemDetail['nama_item']);
        } else {
          print("Error");
        }
      });
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

  void decrement() {
    if (count.value > 1) {
      count.value--;
    }
  }

  void increment() => count.value++;
}
