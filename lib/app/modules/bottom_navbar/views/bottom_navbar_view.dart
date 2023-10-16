import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lentera_cafe_app/app/constants/colors.dart';
import 'package:lentera_cafe_app/app/modules/cart/views/cart_view.dart';
import 'package:lentera_cafe_app/app/modules/home/views/home_view.dart';
import 'package:lentera_cafe_app/app/modules/profile/views/profile_view.dart';
import 'package:lentera_cafe_app/app/modules/saw/views/saw_view.dart';

import '../controllers/bottom_navbar_controller.dart';

class BottomNavbarView extends GetView<BottomNavbarController> {
  const BottomNavbarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavbarController>(builder: (controller) {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: const [
            HomeView(),
            CartView(),
            SawView(),
            ProfileView(),
          ],
        ),
        bottomNavigationBar: Container(
          height: 70,
          child: BottomNavigationBar(
            backgroundColor: ColorsCafe.popUpBackground,
            selectedItemColor: ColorsCafe.primaryRed,
            type: BottomNavigationBarType.fixed,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            iconSize: 18,
            items: const [
              BottomNavigationBarItem(
                activeIcon: ImageIcon(
                  AssetImage('assets/icons/home.png'),
                  color: ColorsCafe.primaryRed,
                ),
                icon: ImageIcon(
                  AssetImage('assets/icons/home.png'),
                  color: ColorsCafe.greyText,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                activeIcon: ImageIcon(
                  AssetImage('assets/icons/cart.png'),
                  color: ColorsCafe.primaryRed,
                ),
                icon: ImageIcon(
                  AssetImage('assets/icons/cart.png'),
                  color: ColorsCafe.greyText,
                ),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                activeIcon: ImageIcon(
                  AssetImage('assets/icons/saw.png'),
                  color: ColorsCafe.primaryRed,
                ),
                icon: ImageIcon(
                  AssetImage('assets/icons/saw.png'),
                  color: ColorsCafe.greyText,
                ),
                label: 'Saw',
              ),
              BottomNavigationBarItem(
                activeIcon: ImageIcon(
                  AssetImage('assets/icons/profile.png'),
                  color: ColorsCafe.primaryRed,
                ),
                icon: ImageIcon(
                  AssetImage('assets/icons/profile.png'),
                  color: ColorsCafe.greyText,
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      );
    });
  }
}
