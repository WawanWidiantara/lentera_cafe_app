import 'package:flutter/material.dart';
import 'package:lentera_cafe_app/app/constants/colors.dart';
import 'package:get/get.dart';
import 'package:lentera_cafe_app/app/constants/icons.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: ColorsCafe.popUpBackground,
        ),
        child: Center(
          child: Image.asset(
            IconsCafe.logoFull,
            width: 270,
          ),
        ),
      ),
    );
  }
}
