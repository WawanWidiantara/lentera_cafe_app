import 'package:get/get.dart';

import 'package:menu_recommendation_app/app/modules/profile/controllers/detail_riwayat_controller.dart';
import 'package:menu_recommendation_app/app/modules/profile/controllers/riwayat_controller.dart';
import 'package:menu_recommendation_app/app/modules/profile/controllers/transaction_controller.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailRiwayatController>(
      () => DetailRiwayatController(),
    );
    Get.lazyPut<RiwayatController>(
      () => RiwayatController(),
    );
    Get.lazyPut<TransactionController>(
      () => TransactionController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
