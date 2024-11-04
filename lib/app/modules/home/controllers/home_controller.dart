// ignore_for_file: unnecessary_overrides

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menu_recommendation_app/app/constants/url.dart';
import 'package:menu_recommendation_app/app/data/models/items_model.dart';
import 'package:menu_recommendation_app/app/modules/login/controllers/login_controller.dart';
import 'package:http/http.dart' as http;
import 'package:menu_recommendation_app/app/widget/snackbar.dart';

class HomeController extends GetxController {
  var current = 0.obs;
  RxBool isLoading = false.obs;
  var stringUrl = ''.obs;
  var user = "".obs;

  late TextEditingController searchController;

  List<String> items = [
    "Semua",
    "Makanan",
    "Minuman",
    "Snack",
  ];

  List<String> icons = [
    'assets/icons/icon all item.svg',
    'assets/icons/icon makanan.svg',
    'assets/icons/icon minuman.svg',
    'assets/icons/icon snack.svg',
  ];

  final loginC = Get.put(LoginController());
  var userData = {}.obs;
  var itemsList = <Items>[].obs;

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
    final userData = loginC.getStorage.read('user');
    var nama = userData['full_name'];
    String? namaDepan = nama?.split(' ')[0];
    user.value = namaDepan?.capitalize ?? '';
  }

  @override
  void onReady() {
    super.onReady();
    userData.value = loginC.getStorage.read('user');
    fetchItemsData('semua');
    update();
  }

  @override
  void onClose() {
    super.onClose();
    Get.delete<HomeController>();
  }

  Future fetchItemsData(String kategori) async {
    isLoading(false);
    try {
      if (kategori == 'semua') {
        stringUrl.value = "${UrlApi.baseAPI}items/?stok=tersedia";
      } else {
        stringUrl.value =
            "${UrlApi.baseAPI}items/?stok=tersedia&kategori=$kategori";
      }

      var url = Uri.parse(stringUrl.value);
      final response = await http.get(url, headers: {
        'Authorization': 'Token ${loginC.getStorage.read("token")}',
      });
      var result = json.decode(response.body);
      final jsonItems = result['data'].cast<Map<String, dynamic>>();
      itemsList.value = jsonItems.map<Items>((json) {
        return Items.fromJson(json);
      }).toList();
      update(itemsList);
      isLoading(false);
      update();
      return itemsList;
    } catch (e) {
      SnackBarWidget.showSnackBar('Error', '$e', 'err');
      isLoading(false);
    }
  }

  Future searchItem(String search) async {
    isLoading(true);
    try {
      var url = Uri.parse("${UrlApi.baseAPI}items?search=$search");
      final response = await http.get(url, headers: {
        'Authorization': 'Token ${loginC.getStorage.read("token")}',
      });
      var result = json.decode(response.body);
      final jsonItems = result['data'].cast<Map<String, dynamic>>();
      itemsList.value = jsonItems.map<Items>((json) {
        return Items.fromJson(json);
      }).toList();
      update(itemsList);
      isLoading(false);
      update();
      return itemsList;
    } catch (e) {
      SnackBarWidget.showSnackBar('Error', '$e', 'err');
      isLoading(false);
    }
  }
}
