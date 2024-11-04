// ignore_for_file: unnecessary_overrides

import 'dart:convert';

import 'package:get/get.dart';
import 'package:menu_recommendation_app/app/constants/url.dart';
import 'package:menu_recommendation_app/app/data/models/qna_saw_model.dart';
import 'package:menu_recommendation_app/app/modules/login/controllers/login_controller.dart';
import 'package:http/http.dart' as http;
import 'package:menu_recommendation_app/app/widget/snackbar.dart';

class SawController extends GetxController {
  var current = 0.obs;
  var count = 1.obs;
  RxBool isLoading = false.obs;
  var jawaban = {}.obs;

  final loginC = Get.put(LoginController());
  var userData = {}.obs;
  var sawQnAList = <QnaSaw>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    fetchItemsData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future fetchItemsData() async {
    isLoading(false);
    try {
      var url = Uri.parse("${UrlApi.baseAPI}get-pertanyaan/");
      final response = await http.get(url, headers: {
        'Authorization': 'Token ${loginC.getStorage.read("token")}',
      });
      var result = json.decode(response.body);
      final jsonQnAs = result['data'].cast<Map<String, dynamic>>();
      sawQnAList.value = jsonQnAs.map<QnaSaw>((json) {
        return QnaSaw.fromJson(json);
      }).toList();

      update(sawQnAList);
      isLoading(false);
      update();
      return sawQnAList;
    } catch (e) {
      SnackBarWidget.showSnackBar('Error', '$e', 'err');
      isLoading(false);
    }
  }

  void increment(batas) {
    if (count.value < batas) {
      count.value++;
    }
  }

  void insertJawaban(String sub, String jawaban) {
    this.jawaban[sub] = jawaban;
  }
}
