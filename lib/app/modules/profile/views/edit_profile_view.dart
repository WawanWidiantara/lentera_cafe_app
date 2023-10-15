import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

import 'package:get/get.dart';
import 'package:lentera_cafe_app/app/constants/colors.dart';

class EditProfileView extends GetView {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    height: 75,
                    width: 75,
                    child: ProfilePicture(
                      name: 'Gede Widiantara',
                      radius: 31,
                      fontsize: 21,
                    ),
                  ),
                ),
                SizedBox(
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
                  height: 41,
                  child: TextFormField(
                    autofocus: false,
                    // controller: controller.fullNameController,
                    // validator: (value) {
                    //   return controller.validateName(value!);
                    // },
                    style: const TextStyle(
                      fontSize: 12,
                      color: ColorsCafe.greyText,
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(16, 5, 0, 5),
                      hintText: 'Gede Widiantara',
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
                  height: 41,
                  child: TextFormField(
                    autofocus: false,
                    // controller: controller.fullNameController,
                    // validator: (value) {
                    //   return controller.validateName(value!);
                    // },
                    style: const TextStyle(
                      fontSize: 12,
                      color: ColorsCafe.greyText,
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(16, 5, 0, 5),
                      hintText: 'gdwidi13@gmail.com',
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
                SizedBox(
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
                  height: 41,
                  child: TextFormField(
                    autofocus: false,
                    // controller: controller.fullNameController,
                    // validator: (value) {
                    //   return controller.validateName(value!);
                    // },
                    style: const TextStyle(
                      fontSize: 12,
                      color: ColorsCafe.greyText,
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(16, 5, 0, 5),
                      hintText: '082146560178',
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
                SizedBox(
                  height: 125,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(ColorsCafe.primaryRed),
                        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)))),
                    onPressed: () {
                      // controller.kliklogin(
                      //     controller.emailController.text,
                      //     controller.passwordController.text);
                      Get.back();
                      FocusScope.of(context).unfocus();
                      // controller.checkLogin();
                    },
                    child: const Text(
                      "Simpan",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
