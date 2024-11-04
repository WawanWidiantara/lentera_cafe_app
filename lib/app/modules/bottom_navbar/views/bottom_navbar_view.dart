import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:menu_recommendation_app/app/constants/colors.dart';
import 'package:menu_recommendation_app/app/modules/cart/views/cart_view.dart';
import 'package:menu_recommendation_app/app/modules/home/views/home_view.dart';
import 'package:menu_recommendation_app/app/modules/profile/views/profile_view.dart';
import 'package:menu_recommendation_app/app/modules/saw/views/saw_view.dart';
import 'package:transitioned_indexed_stack/transitioned_indexed_stack.dart';

import '../controllers/bottom_navbar_controller.dart';

class BottomNavbarView extends GetView<BottomNavbarController> {
  const BottomNavbarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavbarController>(builder: (controller) {
      return Scaffold(
        body: FadeIndexedStack(
          beginOpacity: 0.0,
          endOpacity: 1.0,
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 200),
          index: controller.tabIndex,
          children: const [
            HomeView(),
            CartView(),
            SawView(),
            ProfileView(),
          ],
        ),
        bottomNavigationBar: SizedBox(
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
                icon: Stack(
                  children: [
                    ImageIcon(
                      AssetImage('assets/icons/cart.png'),
                      color: ColorsCafe.greyText,
                    ),
                  ],
                ),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                activeIcon: ImageIcon(
                  AssetImage('assets/icons/saw.png'),
                  color: ColorsCafe.primaryRed,
                ),
                icon: Stack(
                  children: [
                    ImageIcon(
                      AssetImage('assets/icons/saw.png'),
                      color: ColorsCafe.greyText,
                    ),
                  ],
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
