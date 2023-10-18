import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lentera_cafe_app/app/constants/colors.dart';
import 'package:lentera_cafe_app/app/constants/icons.dart';
import 'package:lentera_cafe_app/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Obx(() => Form(
          key: controller.loginFormKey,
          child: Scaffold(
            body: SizedBox(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 86,
                      ),
                      Center(
                        child: Image.asset(
                          IconsCafe.logo,
                          width: Get.width / 4,
                          height: Get.height / 8,
                        ),
                      ),
                      const SizedBox(
                        height: 72,
                      ),
                      Container(
                        width: Get.width / 3,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: ColorsCafe.primaryRed,
                              width: 2.0,
                            ),
                          ),
                        ),
                        child: Text(
                          "Masuk",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      const Text(
                        "Email *",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        // height: 41,
                        child: TextFormField(
                          autofocus: false,
                          controller: controller.emailController,
                          validator: (value) {
                            return controller.validateEmail(value!);
                          },
                          style: const TextStyle(
                            fontSize: 12,
                            color: ColorsCafe.greyText,
                          ),
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(16, 5, 0, 5),
                            hintText: 'Masukkan email anda',
                            filled: true,
                            fillColor: ColorsCafe.formFill,
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: ColorsCafe.formStroke),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: ColorsCafe.formStroke),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Password *",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        // height: 41,
                        child: TextFormField(
                          obscureText: true,
                          autofocus: false,
                          controller: controller.passwordController,
                          validator: (value) {
                            return controller.validatePassword(value!);
                          },
                          style: const TextStyle(
                            fontSize: 12,
                            color: ColorsCafe.greyText,
                          ),
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(16, 5, 0, 5),
                            hintText: 'Masukkan password anda',
                            filled: true,
                            fillColor: ColorsCafe.formFill,
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: ColorsCafe.formStroke),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                  color: ColorsCafe.formStroke),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      controller.isLoading.value == true
                          ? Center(
                              child: const CircularProgressIndicator(
                                color: ColorsCafe.primaryRed,
                              ),
                            )
                          : SizedBox(
                              width: double.infinity,
                              height: 45,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            ColorsCafe.primaryRed),
                                    shape: MaterialStatePropertyAll<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)))),
                                onPressed: () {
                                  controller.kliklogin(
                                      controller.emailController.text,
                                      controller.passwordController.text);
                                  // Get.toNamed(Routes.BOTTOM_NAVBAR);
                                  FocusScope.of(context).unfocus();
                                  // controller.checkLogin();
                                },
                                child: const Text(
                                  "Masuk",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Text.rich(
                          TextSpan(
                            text: 'Belum punya akun? ',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            children: <InlineSpan>[
                              WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.REGISTER);
                                  },
                                  child: const Text(
                                    'Daftar',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: ColorsCafe.primaryRed),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
