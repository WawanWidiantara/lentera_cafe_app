import 'dart:convert';

import 'package:get/get.dart';
import 'package:lentera_cafe_app/app/constants/url.dart';
import 'package:lentera_cafe_app/app/data/models/items_model.dart';
import 'package:lentera_cafe_app/app/modules/login/controllers/login_controller.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var current = 0.obs;
  RxBool isLoading = false.obs;
  var stringUrl = ''.obs;

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
      print(stringUrl);

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
      print(itemsList[0].gambar);
      isLoading(false);
      update();
      return itemsList;
    } catch (e) {
      isLoading(false);
      throw Exception(e);
    }
  }
}
