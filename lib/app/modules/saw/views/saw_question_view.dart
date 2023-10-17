import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lentera_cafe_app/app/constants/colors.dart';
import 'package:lentera_cafe_app/app/modules/saw/controllers/saw_controller.dart';
import 'package:lentera_cafe_app/app/modules/saw/views/saw_result_view.dart';

class SawQuestionView extends GetView {
  const SawQuestionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SawController());
    return Scaffold(
        backgroundColor: ColorsCafe.primaryRed,
        appBar: AppBar(
          title: const Text(
            '1/5 Pertanyaan',
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: const Offset(0, 5))
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '1.',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            'Bagaimana keadaan cuaca hari ini?',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: InkWell(
                              onTap: () {
                                controller.current.value = index;
                                Get.off(SawResultView());
                              },
                              child: Obx(() => Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: controller.current.value == index
                                            ? ColorsCafe.primaryRed
                                            : ColorsCafe.formStroke,
                                        width: 1),
                                    color: controller.current.value == index
                                        ? ColorsCafe.primaryRed
                                        : ColorsCafe.popUpBackground,
                                  ),
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Text(
                                      'Pilihan ${index + 1}',
                                      style: TextStyle(
                                          color:
                                              controller.current.value == index
                                                  ? Colors.white
                                                  : ColorsCafe.mainText,
                                          fontSize: 16,
                                          fontWeight:
                                              controller.current.value == index
                                                  ? FontWeight.w700
                                                  : FontWeight.w500),
                                    ),
                                  ))),
                            ),
                          );
                        }),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
