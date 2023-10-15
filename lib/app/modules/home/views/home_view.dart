import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lentera_cafe_app/app/constants/colors.dart';
import 'package:lentera_cafe_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) => Column(
            children: <Widget>[
              // SliderWidget(SliderList, "text", "text"),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 38,
                              width: constraints.maxWidth - 100,
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
                            Container(
                              width: 38,
                              height: 38,
                              color: ColorsCafe.primaryRed,
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
                        const SizedBox(
                          height: 10,
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
                              constraints.maxHeight - (Get.height * 1 / 3.7),
                          child: GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 4,
                            childAspectRatio: (2 / 2.2),
                            children: List.generate(
                              4,
                              (index) => Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.ITEM);
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
                                                          Radius.circular(10),
                                                      topRight:
                                                          Radius.circular(10)),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
                                                  ),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Sushi Uzumaki',
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Rp.20.000',
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
                          ),
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
