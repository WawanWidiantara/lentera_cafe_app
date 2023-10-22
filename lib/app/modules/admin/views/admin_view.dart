import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:lentera_cafe_app/app/constants/colors.dart';
import 'package:lentera_cafe_app/app/routes/app_pages.dart';

import '../controllers/admin_controller.dart';

class AdminView extends GetView<AdminController> {
  const AdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminController());
    return Scaffold(
      backgroundColor: ColorsCafe.primaryRed,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Halo, Kasir',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'Gede Widiantara',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            ),
          ],
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
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.scanQR();
                          },
                          child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: ColorsCafe.primaryRed,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: SvgPicture.asset(
                                  'assets/icons/qr.svg',
                                  color: ColorsCafe.popUpBackground,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Pembayaran ',
                          style: TextStyle(
                              color: ColorsCafe.mainText,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.ADMIN_TRANSACTION);
                          },
                          child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: ColorsCafe.primaryRed,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: SvgPicture.asset(
                                  'assets/icons/katalog.svg',
                                  color: ColorsCafe.popUpBackground,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Riwayat\nTransaksi ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: ColorsCafe.mainText,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(child: Container()),
                controller.isLoading.value == true
                    ? Center(
                        child: const CircularProgressIndicator(
                          color: ColorsCafe.primaryRed,
                        ),
                      )
                    : SizedBox(
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
                            controller.kliklogout();
                            FocusScope.of(context).unfocus();
                          },
                          child: const Text(
                            "Keluar",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
