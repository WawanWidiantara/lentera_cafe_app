import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lentera_cafe_app/app/constants/colors.dart';
import 'package:lentera_cafe_app/app/modules/profile/controllers/transaction_controller.dart';
import 'package:lentera_cafe_app/app/modules/profile/views/finish_view.dart';
import 'package:lentera_cafe_app/app/modules/profile/views/waiting_view.dart';

class TransactionView extends GetView<TransactionController> {
  const TransactionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TransactionController());
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Riwayat Pesanan',
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.w700),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Obx(() => TabBar(
                  controller: controller.controller,
                  isScrollable: true,
                  labelPadding: EdgeInsets.symmetric(horizontal: 40.0),
                  tabs: controller.riwayatTabs,
                  labelColor: controller.tabIndex.value == 0
                      ? ColorsCafe.primaryRed
                      : ColorsCafe.primaryGreen,
                  unselectedLabelColor: ColorsCafe.greyText,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 4,
                      color: controller.tabIndex.value == 0
                          ? ColorsCafe.primaryRed
                          : ColorsCafe.primaryGreen,
                    ),
                  ),
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  unselectedLabelStyle:
                      const TextStyle(fontWeight: FontWeight.normal),
                )),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: TabBarView(
              controller: controller.controller,
              children: const [WaitingView(), FinishView()],
            )),
          ],
        ));
  }
}
