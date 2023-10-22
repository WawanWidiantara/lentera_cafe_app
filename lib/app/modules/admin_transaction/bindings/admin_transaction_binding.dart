import 'package:get/get.dart';

import 'package:lentera_cafe_app/app/modules/admin_transaction/controllers/detail_nota_controller.dart';
import 'package:lentera_cafe_app/app/modules/admin_transaction/controllers/list_nota_controller.dart';

import '../controllers/admin_transaction_controller.dart';

class AdminTransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailNotaController>(
      () => DetailNotaController(),
    );
    Get.lazyPut<ListNotaController>(
      () => ListNotaController(),
    );

    Get.lazyPut<AdminTransactionController>(
      () => AdminTransactionController(),
    );
  }
}
