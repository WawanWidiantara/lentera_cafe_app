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
                height: Get.height / 2,
              ),
            ),
            const Text(
              'Bingung mau pilih menu apa?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 20),
            const Text(
              'Fitur ini, membuat anda dengan mudah menemukan menu makanan yang sesuai dengan preferensi dan kebutuhan anda. Jawab beberapa pertanyaan berikut untuk mendapatkan rekomendasi menunya.',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 40),
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
                  Get.to(const SawQuestionView());

                  FocusScope.of(context).unfocus();
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
