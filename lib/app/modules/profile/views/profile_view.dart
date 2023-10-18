import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

import 'package:get/get.dart';
import 'package:lentera_cafe_app/app/constants/colors.dart';
import 'package:lentera_cafe_app/app/modules/profile/views/edit_profile_view.dart';
import 'package:lentera_cafe_app/app/modules/profile/views/transaction_view.dart';
// import 'package:lentera_cafe_app/app/routes/app_pages.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Profil',
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.w700),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 75,
                        width: 75,
                        child: ProfilePicture(
                          name: 'Gede Widiantara',
                          radius: 31,
                          fontsize: 21,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Gede Widiantara',
                        style: TextStyle(
                            color: ColorsCafe.mainText,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'gdwidi13@gmail.com',
                        style: TextStyle(
                            color: ColorsCafe.mainText,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  ColorsCafe.popUpBackground),
                              shape: MaterialStatePropertyAll<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                          onPressed: () {
                            // controller.kliklogin(
                            //     controller.emailController.text,
                            //     controller.passwordController.text);
                            Get.to(EditProfileView());
                            FocusScope.of(context).unfocus();
                            // controller.checkLogin();
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Edit profil",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: ColorsCafe.mainText),
                                ),
                                Icon(Icons.arrow_forward_ios_rounded,
                                    size: 20, color: ColorsCafe.mainText)
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  ColorsCafe.popUpBackground),
                              shape: MaterialStatePropertyAll<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                          onPressed: () {
                            // controller.kliklogin(
                            //     controller.emailController.text,
                            //     controller.passwordController.text);
                            Get.to(TransactionView());
                            FocusScope.of(context).unfocus();
                            // controller.checkLogin();
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Riwayat pesanan",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: ColorsCafe.mainText),
                                ),
                                Icon(Icons.arrow_forward_ios_rounded,
                                    size: 20, color: ColorsCafe.mainText)
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  ColorsCafe.popUpBackground),
                              shape: MaterialStatePropertyAll<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                          onPressed: () {
                            // controller.kliklogin(
                            //     controller.emailController.text,
                            //     controller.passwordController.text);
                            // Get.offAllNamed(Routes.LOGIN);
                            FocusScope.of(context).unfocus();
                            // controller.checkLogin();
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Versi aplikasi",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: ColorsCafe.mainText),
                                ),
                                Text(
                                  "V.0.1.0",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: ColorsCafe.formStroke),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 125,
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
                                    backgroundColor: MaterialStatePropertyAll(
                                        ColorsCafe.primaryRed),
                                    shape: MaterialStatePropertyAll<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)))),
                                onPressed: () {
                                  controller.kliklogout();
                                  FocusScope.of(context).unfocus();
                                },
                                child: const Text(
                                  "Keluar",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ))),
      ),
    );
  }
}
