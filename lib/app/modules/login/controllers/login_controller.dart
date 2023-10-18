import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lentera_cafe_app/app/constants/url.dart';
import 'package:lentera_cafe_app/app/data/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:lentera_cafe_app/app/routes/app_pages.dart';

class LoginController extends GetxController {
  late User user;
  final getStorage = GetStorage();
  final loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;
  var email = '';
  var password = '';
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Email tidak boleh kosong";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Password tidak boleh kosong";
    }
    return null;
  }

  kliklogin(String email, String password) {
    final isValid = loginFormKey.currentState!.validate();
    if (isValid) {
      isLoading(true);
      var url = Uri.parse("${UrlApi.baseAPI}account/login/");
      var inputLogin = json.encode({
        "username": email,
        "password": password,
      });
      http
          .post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: inputLogin,
      )
          .then((res) {
        if (res.statusCode == 200) {
          var response = json.decode(res.body);
          getStorage.write("token", response['token']);
          var user = User.fromJson(response['user']);
          getStorage.write('user', user.toJson());
          isLoading(false);
          Get.offAllNamed(Routes.BOTTOM_NAVBAR);
        } else {
          print("Login Invalid");
          isLoading(false);
        }
      }).catchError((err) {
        print("$err");
        isLoading(false);
      });
    }
    loginFormKey.currentState!.save();
  }
}
