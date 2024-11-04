import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:menu_recommendation_app/app/constants/colors.dart';
import 'package:menu_recommendation_app/app/modules/saw/controllers/result_saw_controller.dart';
import 'package:menu_recommendation_app/app/routes/app_pages.dart';

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
      body: LayoutBuilder(
        builder: (context, constraints) => Column(
          children: <Widget>[
            Obx(() => Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: SizedBox(
                        height: constraints.maxHeight - (Get.height * 1 / 50),
                        child: ListView.builder(
                          itemCount: controller.itemsList.isEmpty
                              ? 1
                              : controller.itemsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: controller.itemsList.isEmpty
                                  ? SizedBox(
                                      height: Get.height * 1 / 2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 10,
                                          )
                                        ],
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        Get.toNamed(Routes.ITEM,
                                            arguments:
                                                controller.itemsList[index].id);
                                      },
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        elevation: 5,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            AspectRatio(
                                              aspectRatio: 3 / 1.3,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10)),
                                                  image: DecorationImage(
                                                      image: NetworkImage(controller
                                                                  .itemsList[
                                                                      index]
                                                                  .gambar !=
                                                              null
                                                          ? controller
                                                              .itemsList[index]
                                                              .gambar
                                                              .toString()
                                                          : 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      20, 10, 20, 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        controller
                                                            .itemsList[index]
                                                            .namaItem
                                                            .toString(),
                                                        style: const TextStyle(
                                                            color: ColorsCafe
                                                                .mainText,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'Rp. ${controller.itemsList[index].harga.toString()}',
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: ColorsCafe
                                                            .mainText),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 2,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
