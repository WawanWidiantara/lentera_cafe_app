// ignore_for_file: unnecessary_overrides

import 'dart:convert';

import 'package:get/get.dart';
import 'package:lentera_cafe_app/app/constants/url.dart';
import 'package:lentera_cafe_app/app/modules/login/controllers/login_controller.dart';
import 'package:lentera_cafe_app/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;
import 'package:lentera_cafe_app/app/widget/snackbar.dart';

class SplashController extends GetxController {
  final loginC = Get.put(LoginController());
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    if (loginC.getStorage.read("token") != "" &&
        loginC.getStorage.read("token") != null) {
      final userLogin = loginC.getStorage.read('user');
      final idUser = userLogin['id'];

      try {
        var url = Uri.parse("${UrlApi.baseAPI}account/users/$idUser");
        http.get(url, headers: {
          'Authorization': 'Token ${loginC.getStorage.read("token")}',
        }).then((res) {
          if (res.statusCode == 200) {
            var response = json.decode(res.body);
            if (response['user']['is_admin'] == true) {
              Future.delayed(const Duration(seconds: 3), () {
                Get.offAllNamed(Routes.ADMIN);
              });
            } else {
              Future.delayed(const Duration(seconds: 3), () {
                Get.offAllNamed(Routes.BOTTOM_NAVBAR);
              });
            }
          } else {
            Future.delayed(const Duration(seconds: 3), () {
              Get.offAllNamed(Routes.LOGIN);
            });
          }
        });
      } catch (e) {
        SnackBarWidget.showSnackBar('Error', '$e', 'err');
      }
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAllNamed(Routes.LOGIN);
      });
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
