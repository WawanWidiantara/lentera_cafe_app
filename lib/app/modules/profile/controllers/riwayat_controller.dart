import 'dart:convert';

import 'package:get/get.dart';
import 'package:lentera_cafe_app/app/constants/url.dart';
import 'package:lentera_cafe_app/app/data/models/cart_model.dart';
import 'package:lentera_cafe_app/app/modules/login/controllers/login_controller.dart';
import 'package:http/http.dart' as http;

class RiwayatController extends GetxController {
  final loginC = Get.put(LoginController());
  RxBool isLoading = false.obs;
  var menungguList = <Cart>[].obs;
  var selesaiList = <Cart>[].obs;

  // final count = 0.obs;
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
    isLoading(false);
    try {
      final userData = loginC.getStorage.read('user');
      final idUser = userData['id'];
      var url =
          Uri.parse("${UrlApi.baseAPI}orders?user=$idUser&status=dikonfirmasi");
      final response = await http.get(url, headers: {
        'Authorization': 'Token ${loginC.getStorage.read("token")}',
      });
      var result = json.decode(response.body);
      // print(result);
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
        // var cart = Cart.fromJson(result[0]);
        // menungguList.value = cart.toJson();
        print(menungguList[0].orderItem?[0].namaItem);
        update();
        isLoading(false);
        update();
        return menungguList;
      }
    } catch (e) {
      isLoading(false);
      throw Exception(e);
    }
  }

  Future fetchFinish() async {
    isLoading(false);
    try {
      final userData = loginC.getStorage.read('user');
      final idUser = userData['id'];
      // var url = Uri.parse("${UrlApi.baseAPI}orders/?user=$idUser");
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
        // var cart = Cart.fromJson(result[0]);
        // selesaiList.value = cart.toJson();
        print(selesaiList[0].orderItem?[0].namaItem);
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

  // void increment() => count.value++;
}
