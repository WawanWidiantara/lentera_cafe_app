import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lentera_cafe_app/app/constants/url.dart';
import 'package:http/http.dart' as http;
import 'package:lentera_cafe_app/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  final registerFormKey = GlobalKey<FormState>();
  late TextEditingController namaController,
      emailController,
      passwordController,
      telpController;
  var nama = '';
  var email = '';
  var password = '';
  var telp = '';
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    namaController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    telpController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  String? validateNama(String value) {
    if (value.isEmpty) {
      return "Nama tidak boleh kosong";
    }
    return null;
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

  String? validateTelp(String value) {
    if (value.isEmpty) {
      return "Nomor telepon tidak boleh kosong";
    }
    return null;
  }

  klikregister(String nama, String email, String password, String telp) {
    final isValid = registerFormKey.currentState!.validate();
    if (isValid) {
      isLoading(true);
      var url = Uri.parse("${UrlApi.baseAPI}account/register/");
      var inputRegister = json.encode({
        "full_name": nama,
        "email": email,
        "password": password,
        "profile_picture": null,
        "phone_number": telp,
      });
      http
          .post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: inputRegister,
      )
          .then((res) {
        if (res.statusCode == 200) {
          isLoading(false);
          Get.offAllNamed(Routes.LOGIN);
        } else {
          print(res.statusCode);
          isLoading(false);
        }
      }).catchError((err) {
        print("$err");
        isLoading(false);
      });
    }
    registerFormKey.currentState!.save();
  }
}
