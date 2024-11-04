import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

import 'package:get/get.dart';
import 'package:menu_recommendation_app/app/constants/colors.dart';
import 'package:menu_recommendation_app/app/modules/profile/controllers/edit_controller.dart';

class EditProfileView extends GetView {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditController());
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Edit Profil',
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.w700),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: controller.profileFormKey,
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                      height: 75,
                      width: 75,
                      child: ProfilePicture(
                        name: controller.user.toString(),
                        radius: 31,
                        fontsize: 21,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Nama",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: TextFormField(
                      autofocus: false,
                      controller: controller.namaController,
                      validator: (value) {
                        return controller.validateName(value!);
                      },
                      style: const TextStyle(
                        fontSize: 12,
                        color: ColorsCafe.greyText,
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(16, 5, 0, 5),
                        filled: true,
                        fillColor: ColorsCafe.formFill,
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: ColorsCafe.formStroke),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: ColorsCafe.formStroke),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
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
                        contentPadding: const EdgeInsets.fromLTRB(16, 5, 0, 5),
                        filled: true,
                        fillColor: ColorsCafe.formFill,
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: ColorsCafe.formStroke),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: ColorsCafe.formStroke),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Nomor Telepon",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: TextFormField(
                      autofocus: false,
                      controller: controller.noHpController,
                      validator: (value) {
                        return controller.validateNoHP(value!);
                      },
                      style: const TextStyle(
                        fontSize: 12,
                        color: ColorsCafe.greyText,
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(16, 5, 0, 5),
                        filled: true,
                        fillColor: ColorsCafe.formFill,
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: ColorsCafe.formStroke),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: ColorsCafe.formStroke),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 125,
                  ),
                  controller.isLoading.value == true
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: ColorsCafe.primaryRed,
                          ),
                        )
                      : SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: const MaterialStatePropertyAll(
                                    ColorsCafe.primaryRed),
                                shape: MaterialStatePropertyAll<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)))),
                            onPressed: () {
                              controller.simpan(
                                  controller.namaController.text,
                                  controller.emailController.text,
                                  controller.noHpController.text);
                              FocusScope.of(context).unfocus();
                            },
                            child: const Text(
                              "Simpan",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        )));
  }
}
