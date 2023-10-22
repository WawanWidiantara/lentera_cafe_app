// ignore_for_file: unnecessary_overrides

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lentera_cafe_app/app/constants/colors.dart';
import 'package:lentera_cafe_app/app/constants/icons.dart';
import 'package:lentera_cafe_app/app/constants/url.dart';
import 'package:lentera_cafe_app/app/data/models/cart_model.dart';
import 'package:lentera_cafe_app/app/modules/login/controllers/login_controller.dart';
import 'package:lentera_cafe_app/app/modules/profile/views/detail_transaction_view.dart';
import 'package:lentera_cafe_app/app/widget/snackbar.dart';

class CartController extends GetxController {
  final loginC = Get.put(LoginController());
  RxBool isLoading = false.obs;
  var cartData = {}.obs;
  var test = 'a';

  final count = 1.obs;
  @override
  void onInit() {
    super.onInit();
    fetchCartData();
  }

  @override
  void onReady() {
    super.onReady();
    fetchCartData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future fetchCartData() async {
    isLoading(false);
    try {
      final userData = loginC.getStorage.read('user');
      final idUser = userData['id'];

      var url =
          Uri.parse("${UrlApi.baseAPI}orders?user=$idUser&status=keranjang");
      final response = await http.get(url, headers: {
        'Authorization': 'Token ${loginC.getStorage.read("token")}',
      });
      var result = json.decode(response.body);

      if (result.isEmpty) {
        cartData.value = {};
        update();
        isLoading(false);
        update();
        return cartData;
      } else {
        var cart = Cart.fromJson(result[0]);
        cartData.value = cart.toJson();
        isLoading(false);
        update();
        return cartData;
      }
    } catch (e) {
      SnackBarWidget.showSnackBar('Error', '$e', 'err');
      isLoading(false);
    }
  }

  decrement(int idItem, int jumlahPesanan, String catatan) {
    isLoading(false);
    if (jumlahPesanan > 1) {
      try {
        var url = Uri.parse("${UrlApi.baseAPI}orders/");
        var inputOrder = json.encode({
          "item_id": idItem,
          "jumlah_pesanan": jumlahPesanan - 1,
          "catatan": catatan,
        });
        http
            .post(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Token ${loginC.getStorage.read("token")}',
          },
          body: inputOrder,
        )
            .then((res) {
          if (res.statusCode == 200) {
            fetchCartData();
            isLoading(false);
            update();
          } else {
            SnackBarWidget.showSnackBar(
                'Gagal mengubah stok', '${res.statusCode}', 'err');
            isLoading(false);
            update();
          }
        });
      } catch (e) {
        SnackBarWidget.showSnackBar('Error', '$e', 'err');
        isLoading(false);
      }
    }
  }

  Future konfirmasiOrder(int idCart, BuildContext context) async {
    isLoading(false);
    try {
      var url = Uri.parse("${UrlApi.baseAPI}orders/$idCart/confirm_order/");

      await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Token ${loginC.getStorage.read("token")}',
        },
      ).then((res) {
        if (res.statusCode == 200) {
          fetchCartData();
          isLoading(false);
          update();
          return showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Builder(
                    builder: (context) {
                      return SizedBox(
                        height: Get.height * 1 / 2.8,
                        width: Get.width * 1 / 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Pesanan diterima',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Image.asset(
                                IconsCafe.confeti,
                                width: Get.width / 4,
                                height: Get.height / 8,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Pesanan kamu telah diterima, cek riwayat pemesanan atau lanjutkan pembayaran dengan menyerahkan kode QR ke kasir',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 45,
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                              ColorsCafe.primaryRed),
                                      shape: MaterialStatePropertyAll<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)))),
                                  onPressed: () {
                                    Get.back();
                                    Get.to(const DetailTransactionView(),
                                        arguments: [idCart, 'menunggu']);
                                  },
                                  child: const Text(
                                    "Proses Pesanan",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  )),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                );
              });
        } else {
          SnackBarWidget.showSnackBar('Gagal konfirmasi peesanan',
              'Error Status Code: ${res.statusCode}', 'err');
          isLoading(false);
          update();
        }
      });
    } catch (e) {
      SnackBarWidget.showSnackBar('Error', '$e', 'err');
      isLoading(false);
    }
  }

  Future increment(int idItem, int jumlahPesanan, String catatan) async {
    isLoading(false);

    try {
      var url = Uri.parse("${UrlApi.baseAPI}orders/");
      var inputOrder = json.encode({
        "item_id": idItem,
        "jumlah_pesanan": jumlahPesanan + 1,
        "catatan": catatan,
      });
      await http
          .post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Token ${loginC.getStorage.read("token")}',
        },
        body: inputOrder,
      )
          .then((res) {
        if (res.statusCode == 200) {
          fetchCartData();
          isLoading(false);
          update();
        } else {
          SnackBarWidget.showSnackBar(
              'Gagal mengubah stok', '${res.statusCode}', 'err');
          isLoading(false);
          update();
        }
      });
    } catch (e) {
      SnackBarWidget.showSnackBar('Error', '$e', 'err');
      isLoading(false);
    }
  }

  Future deleteCartItem(int cartItem) async {
    isLoading(false);

    try {
      var url = Uri.parse("${UrlApi.baseAPI}orderitems/$cartItem/");

      await http.delete(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Token ${loginC.getStorage.read("token")}',
        },
      ).then((res) {
        if (res.statusCode == 204) {
          fetchCartData();
          isLoading(false);
          update();
        } else {
          SnackBarWidget.showSnackBar('Gagal menghapus item',
              'Error Status Code: ${res.statusCode}', 'err');
          isLoading(false);
          update();
        }
      });
    } catch (e) {
      SnackBarWidget.showSnackBar('Error', '$e', 'err');
      isLoading(false);
    }
  }
}
