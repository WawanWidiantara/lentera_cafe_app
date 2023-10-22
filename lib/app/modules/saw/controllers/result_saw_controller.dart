// ignore_for_file: unnecessary_overrides

import 'dart:convert';

import 'package:get/get.dart';
import 'package:lentera_cafe_app/app/constants/url.dart';
import 'package:lentera_cafe_app/app/data/models/items_model.dart';
import 'package:lentera_cafe_app/app/modules/login/controllers/login_controller.dart';
import 'package:http/http.dart' as http;
import 'package:lentera_cafe_app/app/widget/snackbar.dart';

class ResultSawController extends GetxController {
  var saw = Get.arguments;
  final loginC = Get.put(LoginController());
  var itemsList = <Items>[].obs;
  RxBool isLoading = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    fetchItemsData();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future fetchItemsData() async {
    isLoading(false);
    try {
      var url = Uri.parse("${UrlApi.baseAPI}saw/");
      var inputSAW = json.encode(saw);

      await http
          .post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Token ${loginC.getStorage.read("token")}',
        },
        body: inputSAW,
      )
          .then((res) {
        if (res.statusCode == 200) {
          var result = json.decode(res.body);
          final jsonItems = result['data'].cast<Map<String, dynamic>>();
          itemsList.value = jsonItems.map<Items>((json) {
            return Items.fromJson(json);
          }).toList();
          update(itemsList);
          isLoading(false);
          update();
        } else {
          SnackBarWidget.showSnackBar('Gagal menampilkan hasil',
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
