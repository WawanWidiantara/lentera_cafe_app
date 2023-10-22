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
          title: Obx(() => Text(
                controller.sawQnAList.isEmpty
                    ? ''
                    : '${controller.count}/${controller.sawQnAList.length} Pertanyaan',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              )),
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
                        Obx(() => Text(
                              controller.sawQnAList.isEmpty
                                  ? ''
                                  : '${controller.count}.',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Obx(() => Text(
                                controller.sawQnAList.isEmpty == false
                                    ? '${controller.sawQnAList[controller.count.value - 1].pertanyaan}'
                                    : '',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() => ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.sawQnAList.isEmpty == false
                            ? controller.sawQnAList[controller.count.value - 1]
                                .subkriteria?.length
                            : 0,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: SizedBox(
                              height: 45,
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.insertJawaban(
                                      controller
                                          .sawQnAList[
                                              controller.count.value - 1]
                                          .namaKriteria
                                          .toString(),
                                      controller
                                          .sawQnAList[
                                              controller.count.value - 1]
                                          .subkriteria![index]
                                          .toString());
                                  controller.current.value = index;
                                  controller
                                      .increment(controller.sawQnAList.length);
                                  if (controller.jawaban.length ==
                                      controller.sawQnAList.length) {
                                    Get.off(const SawResultView(),
                                        arguments: controller.jawaban);
                                  }
                                },
                                style: ButtonStyle(
                                  shadowColor: const MaterialStatePropertyAll(
                                      Colors.transparent),
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          ColorsCafe.popUpBackground),
                                  shape: MaterialStatePropertyAll<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          side: const BorderSide(
                                              color: ColorsCafe.formStroke,
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  overlayColor:
                                      MaterialStateProperty.resolveWith<Color?>(
                                    (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.pressed)) {
                                        return ColorsCafe.primaryRed;
                                      }
                                      return null;
                                    },
                                  ),
                                  foregroundColor:
                                      MaterialStateProperty.resolveWith<Color?>(
                                    (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.pressed)) {
                                        return ColorsCafe.popUpBackground;
                                      }
                                      return ColorsCafe.mainText;
                                    },
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Obx(() => Text(
                                          controller.sawQnAList.isEmpty == false
                                              ? '${controller.sawQnAList[controller.count.value - 1].subkriteria?[index]}'
                                              : '',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        )),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })),
                    const SizedBox(
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
