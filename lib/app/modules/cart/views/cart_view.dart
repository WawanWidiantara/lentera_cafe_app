import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lentera_cafe_app/app/constants/colors.dart';
import 'package:lentera_cafe_app/app/routes/app_pages.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());

    controller.fetchCartData();
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text(
              'Keranjang',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            ),
            iconTheme: const IconThemeData(color: Colors.black),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          floatingActionButton: controller.cartData['total_pembayaran'] ==
                      null ||
                  controller.cartData['total_pembayaran'] == 0
              ? SizedBox(
                  height: 10,
                )
              : SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(
                                ColorsCafe.primaryRed),
                            shape: MaterialStatePropertyAll<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        onPressed: () {
                          // controller.kliklogin(
                          //     controller.emailController.text,
                          //     controller.passwordController.text);
                          // Get.back();
                          Get.bottomSheet(
                            isScrollControlled: true,
                            Container(
                                height: Get.height * 0.45,
                                decoration: BoxDecoration(
                                  color: ColorsCafe.popUpBackground,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Container(
                                          width: 20,
                                          height: 5,
                                          color: ColorsCafe.formStroke,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Center(
                                          child: Text(
                                        'Konfirmasi Pesanan',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      )),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Ringkasan pembayaran',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 120,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.25),
                                                  spreadRadius: 0,
                                                  blurRadius: 10,
                                                  offset: const Offset(0, 5))
                                            ]),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 0, 10),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Subtotal',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    Text(
                                                      'Rp. ${controller.cartData['total_pembayaran'] - (controller.cartData['total_pembayaran'] * 1 / 10).round()}',
                                                      style: TextStyle(
                                                          color: ColorsCafe
                                                              .greyText,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Pajak',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    Text(
                                                      'Rp. ${(controller.cartData['total_pembayaran'] * 1 / 10).round()}',
                                                      style: TextStyle(
                                                          color: ColorsCafe
                                                              .greyText,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Divider(
                                                height: 1,
                                                thickness: 1,
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Total',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    Text(
                                                      'Rp. ${controller.cartData['total_pembayaran']}',
                                                      style: TextStyle(
                                                          color: ColorsCafe
                                                              .primaryRed,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        height: 45,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  const MaterialStatePropertyAll(
                                                      ColorsCafe.primaryRed),
                                              shape: MaterialStatePropertyAll<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)))),
                                          onPressed: () {
                                            // controller.kliklogin(
                                            //     controller.emailController.text,
                                            //     controller.passwordController.text);
                                            controller.konfirmasiOrder(
                                                controller.cartData['id'],
                                                context);
                                            FocusScope.of(context).unfocus();
                                            Get.offAllNamed(
                                                Routes.BOTTOM_NAVBAR);
                                            // Get.back();
                                            // print(controller.cartData['id']);
                                            // Get.offAllNamed(
                                            //     Routes.BOTTOM_NAVBAR);
                                            // showDialog(
                                            //     context: context,
                                            //     builder:
                                            //         (BuildContext context) {
                                            //       // ignore: avoid_unnecessary_containers
                                            //       return Container(
                                            //         child: AlertDialog(
                                            //           content: Builder(
                                            //             builder: (context) {
                                            //               return SizedBox(
                                            //                 height: Get.height *
                                            //                     1 /
                                            //                     2.8,
                                            //                 width: Get.width *
                                            //                     1 /
                                            //                     4,
                                            //                 child: Column(
                                            //                   mainAxisAlignment:
                                            //                       MainAxisAlignment
                                            //                           .start,
                                            //                   crossAxisAlignment:
                                            //                       CrossAxisAlignment
                                            //                           .center,
                                            //                   children: [
                                            //                     Text(
                                            //                       'Pesanan diterima',
                                            //                       style:
                                            //                           TextStyle(
                                            //                         fontSize:
                                            //                             18,
                                            //                         fontWeight:
                                            //                             FontWeight
                                            //                                 .w600,
                                            //                       ),
                                            //                     ),
                                            //                     SizedBox(
                                            //                       height: 20,
                                            //                     ),
                                            //                     Center(
                                            //                       child: Image
                                            //                           .asset(
                                            //                         IconsCafe
                                            //                             .confeti,
                                            //                         width:
                                            //                             Get.width /
                                            //                                 4,
                                            //                         height:
                                            //                             Get.height /
                                            //                                 8,
                                            //                       ),
                                            //                     ),
                                            //                     SizedBox(
                                            //                       height: 20,
                                            //                     ),
                                            //                     Text(
                                            //                       'Pesanan kamu telah diterima, cek riwayat pemesanan atau lanjutkan pembayaran dengan menyerahkan kode QR ke kasir',
                                            //                       style: TextStyle(
                                            //                           fontSize:
                                            //                               12,
                                            //                           fontWeight:
                                            //                               FontWeight
                                            //                                   .w500),
                                            //                     ),
                                            //                     SizedBox(
                                            //                       height: 20,
                                            //                     ),
                                            //                     SizedBox(
                                            //                       height: 45,
                                            //                       width: double
                                            //                           .infinity,
                                            //                       child: ElevatedButton(
                                            //                           style: ButtonStyle(backgroundColor: const MaterialStatePropertyAll(ColorsCafe.primaryRed), shape: MaterialStatePropertyAll<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
                                            //                           onPressed: () {
                                            //                             print(controller
                                            //                                 .test);
                                            //                             // Get.to(
                                            //                             //     DetailTransactionView(),
                                            //                             //     arguments: [
                                            //                             //       controller.cartData['id'],
                                            //                             //       'menunggu'
                                            //                             //     ]);
                                            //                             Get.back();
                                            //                             //     arguments: [idInvoice, 'pending']);
                                            //                           },
                                            //                           child: const Text(
                                            //                             "Proses Pesanan",
                                            //                             style: TextStyle(
                                            //                                 fontSize:
                                            //                                     18,
                                            //                                 fontWeight:
                                            //                                     FontWeight.w700),
                                            //                           )),
                                            //                     )
                                            //                   ],
                                            //                 ),
                                            //               );
                                            //             },
                                            //           ),
                                            //           shape:
                                            //               RoundedRectangleBorder(
                                            //                   borderRadius:
                                            //                       BorderRadius
                                            //                           .circular(
                                            //                               10)),
                                            //         ),
                                            //       );
                                            //     });
                                          },
                                          child: const Text(
                                            "Konfirmasi",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          );
                          FocusScope.of(context).unfocus();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Pesan Sekarang",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                            Obx(() => Text(
                                  "Rp. ${controller.cartData['total_pembayaran']}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                )),
                          ],
                        )),
                  )),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: SizedBox(
            child: RefreshIndicator(
              onRefresh: () {
                return Future.delayed(const Duration(milliseconds: 50), () {
                  controller.fetchCartData();
                });
              },
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 75),
                    child: Obx(() => ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        // ignore: unnecessary_null_comparison
                        itemCount: controller.cartData['order_item'] == null
                            ? 0
                            : controller.cartData['order_item'].length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              height: 165,
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
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  '${controller.cartData['order_item'][index]['gambar']}',
                                                ),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Container(
                                          height: 80,
                                          width: 190,
                                          child: Column(
                                            // mainAxisAlignment:
                                            //     MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: 150,
                                                    child: Text(
                                                      '${controller.cartData['order_item'][index]['nama_item']}',
                                                      style: TextStyle(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      controller.deleteCartItem(
                                                          controller.cartData[
                                                                  'order_item']
                                                              [index]['id']);
                                                      print('delete');
                                                    },
                                                    child: Container(
                                                        width: 32,
                                                        height: 32,
                                                        decoration: BoxDecoration(
                                                            color: ColorsCafe
                                                                .popUpBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .grey
                                                                      .withOpacity(
                                                                          0.25),
                                                                  spreadRadius:
                                                                      0,
                                                                  blurRadius:
                                                                      10,
                                                                  offset:
                                                                      const Offset(
                                                                          0, 5))
                                                            ]),
                                                        child: const Icon(
                                                          Icons.delete_outline,
                                                          color: ColorsCafe
                                                              .primaryRed,
                                                        )),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Rp. ${controller.cartData['order_item'][index]['total_harga']}',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                width: 100,
                                                child: Text(
                                                  controller.cartData[
                                                                  'order_item']
                                                                  [index]
                                                                  ['catatan']
                                                              .toString() !=
                                                          ''
                                                      ? '* ${controller.cartData['order_item'][index]['catatan']}'
                                                      : '',
                                                  style: TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: 105,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: ColorsCafe.mainBackground,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 35,
                                                height: 35,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    controller.decrement(
                                                        controller.cartData[
                                                                'order_item']
                                                            [index]['item'],
                                                        controller.cartData[
                                                                    'order_item']
                                                                [index]
                                                            ['jumlah_pesanan'],
                                                        controller.cartData[
                                                                'order_item']
                                                                [index]
                                                                ['catatan']
                                                            .toString());
                                                    // print(controller.count.value);
                                                  },
                                                  style: ButtonStyle(
                                                    padding:
                                                        MaterialStateProperty
                                                            .all(EdgeInsets
                                                                .zero),
                                                    backgroundColor:
                                                        const MaterialStatePropertyAll(
                                                            ColorsCafe
                                                                .formStroke),
                                                  ),
                                                  child: Icon(Icons.remove),
                                                ),
                                              ),
                                              Obx(() => SizedBox(
                                                    width: 35,
                                                    child: Center(
                                                        child: Text(controller
                                                            .cartData[
                                                                'order_item']
                                                                [index][
                                                                'jumlah_pesanan']
                                                            .toString())),
                                                  )),
                                              Container(
                                                width: 35,
                                                height: 35,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    controller.increment(
                                                        controller.cartData[
                                                                'order_item']
                                                            [index]['item'],
                                                        controller.cartData[
                                                                    'order_item']
                                                                [index]
                                                            ['jumlah_pesanan'],
                                                        controller.cartData[
                                                                'order_item']
                                                                [index]
                                                                ['catatan']
                                                            .toString());
                                                  },
                                                  style: ButtonStyle(
                                                    padding:
                                                        MaterialStateProperty
                                                            .all(EdgeInsets
                                                                .zero),
                                                    backgroundColor:
                                                        const MaterialStatePropertyAll(
                                                            ColorsCafe
                                                                .primaryRed),
                                                  ),
                                                  child: Icon(Icons.add),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
