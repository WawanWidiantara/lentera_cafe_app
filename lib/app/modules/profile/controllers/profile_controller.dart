// ignore_for_file: unnecessary_overrides

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lentera_cafe_app/app/constants/url.dart';
import 'package:lentera_cafe_app/app/data/models/user_model.dart';
import 'package:lentera_cafe_app/app/modules/login/controllers/login_controller.dart';
import 'package:http/http.dart' as http;
import 'package:lentera_cafe_app/app/routes/app_pages.dart';
import 'package:lentera_cafe_app/app/widget/snackbar.dart';

class ProfileController extends GetxController {
  final loginC = Get.put(LoginController());
  var user = "".obs;
  var email = "".obs;

  var data = {}.obs;

  RxBool isLoading = false.obs;

  final profileFormKey = GlobalKey<FormState>();
  late TextEditingController namaController, emailController, noHpController;

  @override
  void onInit() {
    super.onInit();
    final userData = loginC.getStorage.read('user');
    String? nama = userData['full_name'];
    user.value = nama?.capitalize ?? '';
    email.value = userData['email'];

    namaController = TextEditingController();
    emailController = TextEditingController();
    noHpController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
    final userData = loginC.getStorage.read('user');
    namaController.text = userData['full_name'];
    emailController.text = userData['email'];
    noHpController.text = userData['phone_number'];
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

  String? validateName(String value) {
    if (value.isEmpty) {
      return "Nama tidak boleh kosong";
    }
    return null;
  }

  String? validateNoHP(String value) {
    if (value.isEmpty) {
      return "Nomor Telepon tidak boleh kosong";
    }
    return null;
  }

  kliklogout() async {
    isLoading(true);
    var url = Uri.parse("${UrlApi.baseAPI}account/logout/");
    var token = 'Token ${loginC.getStorage.read("token")}';

    final response = await http.post(
      url,
      headers: {'Authorization': token},
    );
    if (response.statusCode == 204) {
      loginC.getStorage.write('token', '');
      loginC.getStorage.write('user', '');
      isLoading(false);
      Get.offAllNamed(Routes.LOGIN);
      SnackBarWidget.showSnackBar('Logout Berhasil',
          'Anda telah berhasil keluar ke akun Anda', 'success');
    } else {
      isLoading(false);
      SnackBarWidget.showSnackBar('Gagal keluar dari akun',
          'Error Status Code: ${response.statusCode}', 'err');
    }
  }

  simpan(String nama, String email, String noHp) {
    final isValid = profileFormKey.currentState!.validate();
    final userData = loginC.getStorage.read('user');
    final idUser = userData['id'];
    if (isValid) {
      isLoading(true);
      var url = Uri.parse("${UrlApi.baseAPI}account/users/$idUser/");
      var inputLogin = json.encode({
        "full_name": nama,
        "email": email,
        "phone_number": noHp,
      });
      http
          .patch(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Token ${loginC.getStorage.read("token")}',
        },
        body: inputLogin,
      )
          .then((res) {
        if (res.statusCode == 200) {
          var response = json.decode(res.body);
          var user = User.fromJson(response);
          loginC.getStorage.write('user', user.toJson());
          Get.offAllNamed(Routes.BOTTOM_NAVBAR, arguments: 3);
          isLoading(false);
        } else {
          SnackBarWidget.showSnackBar('Login Gagal',
              'Data yang anda inputkan tidak sesuai ${res.statusCode}', 'err');
          isLoading(false);
        }
      }).catchError((err) {
        SnackBarWidget.showSnackBar('Login Gagal', '$err', 'err');
        isLoading(false);
      });
    }
    profileFormKey.currentState!.save();
  }
}
