import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lentera_cafe_app/app/modules/saw/controllers/result_saw_controller.dart';

class SawResultView extends GetView {
  const SawResultView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResultSawController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rekomendasi menu',
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.w700),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'SawResultView is working',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
                onPressed: () {
                  controller.fetchItemsData();
                  // print(controller.saw);
                },
                child: Text('Back'))
          ],
        ),
      ),
    );
  }
}
