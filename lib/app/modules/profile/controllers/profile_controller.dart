import 'package:get/get.dart';
import 'package:lentera_cafe_app/app/constants/url.dart';
import 'package:lentera_cafe_app/app/modules/login/controllers/login_controller.dart';
import 'package:http/http.dart' as http;
import 'package:lentera_cafe_app/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  final loginC = Get.put(LoginController());

  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  kliklogout() async {
    isLoading(true);
    var url = Uri.parse("${UrlApi.baseAPI}account/logout/");
    var token = 'Token ${loginC.getStorage.read("token")}';
    // loginC.getStorage.write("token", '');
    final response = await http.post(
      url,
      headers: {'Authorization': token},
    );
    if (response.statusCode == 204) {
      loginC.getStorage.write('token', '');
      loginC.getStorage.write('user', '');
      isLoading(false);
      Get.offAllNamed(Routes.LOGIN);
      print("Logout Berhasil");
    } else {
      isLoading(false);
      print("Status code: ${response.statusCode}");
    }
  }
}
