import 'dart:convert';

import 'package:get/get.dart';
import 'package:lentera_cafe_app/app/constants/url.dart';
import 'package:lentera_cafe_app/app/data/models/items_model.dart';
import 'package:lentera_cafe_app/app/modules/login/controllers/login_controller.dart';
import 'package:http/http.dart' as http;

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
      // print(inputSAW);
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
          print(itemsList);
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
