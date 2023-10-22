import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lentera_cafe_app/app/constants/colors.dart';
import 'package:lentera_cafe_app/app/constants/icons.dart';
import 'package:lentera_cafe_app/app/modules/profile/controllers/detail_riwayat_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DetailTransactionView extends GetView {
  const DetailTransactionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailRiwayatController());
    return Scaffold(
        backgroundColor: controller.idTransaksi[1] == 'menunggu'
            ? ColorsCafe.primaryRed
            : ColorsCafe.primaryGreen,
        appBar: AppBar(
          title: const Text(
            'Detail Pesanan',
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            width: Get.width,
            height: double.infinity,
            decoration: const BoxDecoration(
                color: ColorsCafe.popUpBackground,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text.rich(
                      TextSpan(
                        text: '#Order ID : ',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        children: <InlineSpan>[
                          WidgetSpan(
                            alignment: PlaceholderAlignment.baseline,
                            baseline: TextBaseline.alphabetic,
                            child: Text(
                              controller.idTransaksi[0].toString(),
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: controller.idTransaksi[1] == 'menunggu'
                                      ? ColorsCafe.primaryRed
                                      : ColorsCafe.primaryGreen),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                            Obx(() => ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:
                                    controller.detailTransaksi['order_item'] !=
                                            null
                                        ? controller
                                            .detailTransaksi['order_item']
                                            .length
                                        : 0,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Obx(() => Text(
                                              controller.detailTransaksi[
                                                          'order_item'] !=
                                                      null
                                                  ? '${controller.detailTransaksi['order_item'][index]['jumlah_pesanan']}x ${controller.detailTransaksi['order_item'][index]['nama_item']}'
                                                  : '',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            )),
                                        Text(
                                          controller.detailTransaksi[
                                                      'order_item'] !=
                                                  null
                                              ? 'Rp. ${controller.detailTransaksi['order_item'][index]['total_harga']}'
                                              : '',
                                          style: const TextStyle(
                                              color: ColorsCafe.formStroke,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  );
                                })),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              height: 1,
                              thickness: 1,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            controller.idTransaksi[1] == 'menunggu'
                                ? QrImageView(
                                    data: controller.idTransaksi[0].toString(),
                                    version: QrVersions.auto,
                                    size: 200.0,
                                  )
                                : Image.asset(
                                    IconsCafe.success,
                                    width: Get.width / 1.5,
                                    height: Get.height / 3.5,
                                  ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Total',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Obx(() => Text(
                                  controller.detailTransaksi['order_item'] !=
                                          null
                                      ? 'Rp. ${controller.detailTransaksi['total_pembayaran']}'
                                      : 'Rp. 0',
                                  style: TextStyle(
                                    color:
                                        controller.idTransaksi[1] == 'menunggu'
                                            ? ColorsCafe.primaryRed
                                            : ColorsCafe.primaryGreen,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
