import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:menu_recommendation_app/app/constants/colors.dart';
import 'package:menu_recommendation_app/app/modules/home/controllers/notification_controller.dart';
import 'package:menu_recommendation_app/app/modules/profile/views/detail_transaction_view.dart';

class NotificationView extends GetView {
  const NotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifikasi',
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
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Obx(
                () => ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.notifList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: InkWell(
                          onTap: () {
                            Get.to(const DetailTransactionView(), arguments: [
                              controller.notifList[index].order,
                              'menunggu'
                            ]);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.25),
                                      spreadRadius: 0,
                                      blurRadius: 10,
                                      offset: const Offset(0, 5))
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Text(
                                        controller.notifList[index].createdAt
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Container(
                                      width: 130,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(10)),
                                          color: ColorsCafe.primaryRed),
                                      child: const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 10, 20, 10),
                                        child: Center(
                                          child: Text(
                                            'Pembayaran',
                                            style: TextStyle(
                                                color:
                                                    ColorsCafe.popUpBackground,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                                  child: Text(
                                    'Selesaikan Pembayaran',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 20, 20),
                                  child: Text.rich(
                                    TextSpan(
                                      text:
                                          'Selesaikan pembayaran dengan Order id : ',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      children: <InlineSpan>[
                                        TextSpan(
                                          text:
                                              '${controller.notifList[index].order}',
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                              color: ColorsCafe.primaryRed),
                                        ),
                                        const TextSpan(
                                          text:
                                              '. Jika pembayaran tidak dilakukan, pesanan akan dibatalkan.',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ))),
    );
  }
}
