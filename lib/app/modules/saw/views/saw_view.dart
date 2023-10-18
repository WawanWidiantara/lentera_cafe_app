import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lentera_cafe_app/app/constants/colors.dart';
import 'package:lentera_cafe_app/app/constants/icons.dart';
import 'package:lentera_cafe_app/app/modules/saw/views/saw_question_view.dart';

import '../controllers/saw_controller.dart';

class SawView extends GetView<SawController> {
  const SawView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                IconsCafe.sawLogo,
                // width: Get.width / 4,
                height: Get.height / 2,
              ),
            ),
            Text(
              'Bingung mau pilih menu apa?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 20),
            Text(
              'Fitur ini, membuat anda dengan mudah menemukan menu makanan yang sesuai dengan preferensi dan kebutuhan anda. Jawab beberapa pertanyaan berikut untuk mendapatkan rekomendasi menunya.',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(ColorsCafe.primaryRed),
                    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
                onPressed: () {
                  // controller.kliklogin(
                  //     controller.emailController.text,
                  //     controller.passwordController.text);
                  Get.to(SawQuestionView());
                  // controller.fetchItemsData();
                  FocusScope.of(context).unfocus();
                  // controller.checkLogin();
                },
                child: const Text(
                  "Rekomendasi Menu",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
