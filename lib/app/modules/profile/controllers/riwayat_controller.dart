// ignore_for_file: unnecessary_overrides

import 'dart:convert';

import 'package:get/get.dart';
import 'package:menu_recommendation_app/app/constants/url.dart';
import 'package:menu_recommendation_app/app/data/models/cart_model.dart';
import 'package:menu_recommendation_app/app/modules/login/controllers/login_controller.dart';
import 'package:http/http.dart' as http;
import 'package:menu_recommendation_app/app/widget/snackbar.dart';

class RiwayatController extends GetxController {
  final loginC = Get.put(LoginController());
  RxBool isLoading = false.obs;
  var menungguList = <Cart>[].obs;
  var selesaiList = <Cart>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchFinish();
    fetchWaiting();
  }

  @override
  void onReady() {
    super.onReady();
    fetchFinish();
    fetchWaiting();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future fetchWaiting() async {
    isLoading(true);
    try {
      final userData = loginC.getStorage.read('user');
      final idUser = userData['id'];
      var url =
          Uri.parse("${UrlApi.baseAPI}orders?user=$idUser&status=dikonfirmasi");
      final response = await http.get(url, headers: {
        'Authorization': 'Token ${loginC.getStorage.read("token")}',
      });
      var result = json.decode(response.body);

      if (result.isEmpty) {
        menungguList.value = [];
        update();
        isLoading(false);
        update();
        return menungguList;
      } else {
        final jsonItems = result.cast<Map<String, dynamic>>();
        menungguList.value = jsonItems.map<Cart>((json) {
          return Cart.fromJson(json);
        }).toList();
        update();
        isLoading(false);
        update();
        return menungguList;
      }
    } catch (e) {
      isLoading(false);
      SnackBarWidget.showSnackBar('Error', '$e', 'err');
    }
  }

  Future fetchFinish() async {
    isLoading(false);
    try {
      final userData = loginC.getStorage.read('user');
      final idUser = userData['id'];

      var url =
          Uri.parse("${UrlApi.baseAPI}orders?user=$idUser&status=selesai");
      final response = await http.get(url, headers: {
        'Authorization': 'Token ${loginC.getStorage.read("token")}',
      });
      var result = json.decode(response.body);

      if (result.isEmpty) {
        selesaiList.value = [];
        update();
        isLoading(false);
        update();
        return selesaiList;
      } else {
        final jsonItems = result.cast<Map<String, dynamic>>();
        selesaiList.value = jsonItems.map<Cart>((json) {
          return Cart.fromJson(json);
        }).toList();

        update();
        isLoading(false);
        update();
        return selesaiList;
      }
    } catch (e) {
      isLoading(false);
      throw Exception(e);
    }
  }
}
