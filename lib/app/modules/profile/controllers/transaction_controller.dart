import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;
  final List<Tab> riwayatTabs = <Tab>[
    const Tab(text: "Menunggu"),
    const Tab(text: "Selesai"),
  ];
  var tabIndex = 0.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    controller = TabController(length: riwayatTabs.length, vsync: this);
    controller.addListener(() {
      tabIndex.value = controller.index;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
