import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lentera_cafe_app/app/modules/splash/bindings/splash_binding.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: SplashBinding(),
    ),
  );
}
