import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lentera_cafe_app/app/constants/colors.dart';
import 'package:lentera_cafe_app/app/constants/icons.dart';
import 'package:lentera_cafe_app/app/modules/admin_transaction/controllers/detail_nota_controller.dart';

class AdminDetailNotaView extends GetView {
  const AdminDetailNotaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailNotaController());
    return Scaffold(
        backgroundColor: controller.idTransaksi[1] == 'menunggu'
            ? ColorsCafe.primaryRed
            : ColorsCafe.primaryGreen,
        appBar: AppBar(
          title: Text(
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
            decoration: BoxDecoration(
                color: ColorsCafe.popUpBackground,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
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
                                physics: NeverScrollableScrollPhysics(),
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
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            )),
                                        Text(
                                          controller.detailTransaksi[
                                                      'order_item'] !=
                                                  null
                                              ? 'Rp. ${controller.detailTransaksi['order_item'][index]['total_harga']}'
                                              : '',
                                          style: TextStyle(
                                              color: ColorsCafe.formStroke,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  );
                                })),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              height: 1,
                              thickness: 1,
                            ),
                            controller.idTransaksi[1] == 'menunggu'
                                ? SizedBox(
                                    height: 0,
                                  )
                                : Image.asset(
                                    IconsCafe.success,
                                    width: Get.width / 1.5,
                                    height: Get.height / 3.5,
                                  ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Total',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
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
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  controller.isLoading.value == true
                      ? Center(
                          child: const CircularProgressIndicator(
                            color: ColorsCafe.primaryRed,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      ColorsCafe.primaryRed),
                                  shape: MaterialStatePropertyAll<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)))),
                              onPressed: () {
                                // controller.kliklogout();
                                controller.konfirmasiOrder();
                                FocusScope.of(context).unfocus();
                                Get.back();
                              },
                              child: const Text(
                                "Selesaikan Pesanan",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
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
