// ignore_for_file: unnecessary_overrides

import 'dart:convert';

import 'package:get/get.dart';
import 'package:lentera_cafe_app/app/constants/url.dart';
import 'package:lentera_cafe_app/app/data/models/notif_model.dart';
import 'package:lentera_cafe_app/app/modules/login/controllers/login_controller.dart';
import 'package:http/http.dart' as http;
import 'package:lentera_cafe_app/app/widget/snackbar.dart';

class NotificationController extends GetxController {
  final loginC = Get.put(LoginController());
  RxBool isLoading = false.obs;
  var notifList = <Notif>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchNotif();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future fetchNotif() async {
    isLoading(true);
    try {
      final userData = loginC.getStorage.read('user');
      final idUser = userData['id'];
      var url = Uri.parse(
          "${UrlApi.baseAPI}notifications?user=$idUser&is_paid=false");
      final response = await http.get(url, headers: {
        'Authorization': 'Token ${loginC.getStorage.read("token")}',
      });
      var result = json.decode(response.body);

      if (result.isEmpty) {
        notifList.value = [];
        update();
        isLoading(false);
        update();
        return notifList;
      } else {
        final jsonItems = result.cast<Map<String, dynamic>>();
        notifList.value = jsonItems.map<Notif>((json) {
          return Notif.fromJson(json);
        }).toList();
        update();
        isLoading(false);
        update();
        return notifList;
      }
    } catch (e) {
      isLoading(false);
      SnackBarWidget.showSnackBar('Error', '$e', 'err');
    }
  }
}
