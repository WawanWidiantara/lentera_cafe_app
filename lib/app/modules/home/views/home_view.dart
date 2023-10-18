import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:lentera_cafe_app/app/constants/colors.dart';
import 'package:lentera_cafe_app/app/modules/home/views/notification_view.dart';
import 'package:lentera_cafe_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsCafe.mainBackground,
        body: LayoutBuilder(
          builder: (context, constraints) => Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 38,
                              width: constraints.maxWidth - 90,
                              child: TextFormField(
                                onChanged: (search) {},
                                onSaved: (search) {},
                                textAlignVertical: TextAlignVertical.center,
                                autofocus: false,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: ColorsCafe.greyText,
                                ),
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                  prefixIcon: const Icon(Icons.search),
                                  prefixIconColor: ColorsCafe.greyText,
                                  hintText: 'Cari',
                                  filled: true,
                                  fillColor: ColorsCafe.formFill,
                                  errorBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: ColorsCafe.formStroke),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: ColorsCafe.formStroke),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(NotificationView());
                              },
                              child: Container(
                                  width: 38,
                                  height: 38,
                                  decoration: BoxDecoration(
                                    color: ColorsCafe.primaryRed,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset(
                                      'assets/icons/icon notif.svg',
                                      color: ColorsCafe.popUpBackground,
                                    ),
                                  )),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Text.rich(
                          TextSpan(
                            text: 'Halo, ',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                            children: <InlineSpan>[
                              WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: Text(
                                  // _carsC.user.toString(),
                                  'Widi',
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: ColorsCafe.primaryRed),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "Mau makan apa hari ini?",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: Get.width,
                          height: 90,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Container(
                                  width: 65,
                                  height: 90,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controller.current.value = index;
                                          controller.fetchItemsData(controller
                                              .items[index]
                                              .toLowerCase());
                                          print(controller.items[index]);
                                        },
                                        child: SizedBox(
                                          child: Obx(() => Container(
                                                width: 65,
                                                height: 65,
                                                decoration: BoxDecoration(
                                                  color: controller
                                                              .current.value ==
                                                          index
                                                      ? ColorsCafe.primaryRed
                                                      : ColorsCafe
                                                          .popUpBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  child: SvgPicture.asset(
                                                    controller.icons[index],
                                                    color: controller.current
                                                                .value ==
                                                            index
                                                        ? ColorsCafe
                                                            .popUpBackground
                                                        : ColorsCafe.primaryRed,
                                                  ),
                                                ),
                                              )),
                                        ),
                                      ),
                                      Text(controller.items[index]),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Semua menu",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height:
                              constraints.maxHeight - (Get.height * 1 / 2.4),
                          child: Obx(() => GridView.count(
                                crossAxisCount: 2,
                                crossAxisSpacing: 4,
                                mainAxisSpacing: 4,
                                childAspectRatio: (2 / 2.2),
                                children: List.generate(
                                  controller.itemsList.length,
                                  (index) => Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: InkWell(
                                      onTap: () {
                                        Get.toNamed(Routes.ITEM,
                                            arguments:
                                                controller.itemsList[index].id);
                                      },
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        elevation: 5,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.ce,
                                          children: [
                                            AspectRatio(
                                              aspectRatio: 3 / 2.1,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10)),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                        controller
                                                                    .itemsList[
                                                                        index]
                                                                    .gambar !=
                                                                null
                                                            ? controller
                                                                .itemsList[
                                                                    index]
                                                                .gambar
                                                                .toString()
                                                            : 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
                                                      ),
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    controller.itemsList[index]
                                                        .namaItem
                                                        .toString(),
                                                    style: const TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'Rp. ${controller.itemsList[index].harga.toString()}',
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
