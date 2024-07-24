import 'package:deliverypartner/config/const_string.dart';
import 'package:deliverypartner/config/const_wid.dart';
import 'package:deliverypartner/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:slide_to_act/slide_to_act.dart';

class HomeOrderMapWid extends StatelessWidget {
  final double height, width;
  final HomeController controller;
  const HomeOrderMapWid({
    super.key,
    required this.height,
    required this.width,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    Widget reasonWid(String title) {
      return Row(
        children: [
          Obx(
            () => Radio(
              value: controller.selectReason.value,
              groupValue: title,
              onChanged: (value) {
                controller.selectReason.value = title;
              },
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                controller.selectReason.value = title;
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 15,
                ),
                color: ColorTheme.white,
                child: Text(
                  title,
                  style: styleC(
                    ColorTheme.black,
                    16,
                    FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      );
    }

    return SizedBox(
      child: controller.activegps.value == false
          ? Container(
              height: Get.height,
              width: Get.width,
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 250,
                      width: 250,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Image.asset('assets/images/nogps.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Text(
                        'You must activate GPS to get your location',
                        textAlign: TextAlign.center,
                        style: styleC(
                          ColorTheme.black,
                          15,
                          FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.getUserLocation();
                      },
                      child: Text(
                        'try again',
                        style: styleC(
                          ColorTheme.black,
                          15,
                          FontWeight.w800,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        height: 457,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(
                          top: 15,
                          left: 20,
                          right: 20,
                          bottom: 20,
                        ),
                        child: GoogleMap(
                          zoomControlsEnabled: false,
                          mapType: MapType.normal,
                          // markers: provmaps.markers,
                          onCameraMove: controller.onCameraMove,
                          initialCameraPosition: CameraPosition(
                            target: controller.initialPos,
                            zoom: controller.zoomlvl,
                          ),
                          onMapCreated: controller.onCreated,
                          onCameraIdle: () async {
                            controller.getMoveCamera();
                          },
                        ),
                      ),
                      // const Align(
                      //   alignment: Alignment.center,
                      //   child: Icon(
                      //     Icons.location_on,
                      //     size: 50,
                      //     color: Colors.redAccent,
                      //   ),
                      // ),
                      Positioned(
                        top: 30,
                        left: 80,
                        right: 80,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: ColorTheme.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Time Left : 20Min 19Sec",
                              style: styleC(
                                ColorTheme.black,
                                16,
                                FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 20,
                      height: 63,
                      child: SlideAction(
                        borderRadius: 10,
                        elevation: 0,
                        innerColor: ColorTheme.green,
                        outerColor: ColorTheme.green.withOpacity(.43),
                        reversed: false,
                        sliderButtonIcon: Icon(
                          Icons.keyboard_double_arrow_right,
                          size: 20,
                          color: ColorTheme.white,
                        ),
                        text: !controller.orderStatus()
                            ? "Swipe right after Order Pickup"
                            : "Swipe right after order deliver",
                        textStyle: styleC(
                          ColorTheme.black.withOpacity(.5),
                          16,
                          FontWeight.w600,
                        ),
                        onSubmit: () async {
                          if (controller.orderStatus()) {
                            controller.showAlertDialog(context);
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  CupertinoAlertDialog(
                                title: Text(
                                  "Confirm Order Pick-Up",
                                  style: styleC(
                                    ColorTheme.black,
                                    16,
                                    FontWeight.w500,
                                  ),
                                ),
                                content: Text(
                                  "Total 3 Orders Pick-Up",
                                  style: styleC(
                                    ColorTheme.black,
                                    14,
                                    FontWeight.w500,
                                  ),
                                ),
                                actions: <Widget>[
                                  CupertinoDialogAction(
                                    isDefaultAction: true,
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text(
                                      "Decline",
                                      style: styleC(
                                        ColorTheme.primary,
                                        16,
                                        FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  CupertinoDialogAction(
                                    onPressed: () async {
                                      for (var i in controller.smapleOrderLi) {
                                        i['status'] = 'accepted';
                                      }
                                      controller.screen.value = 'List Order';
                                      await controller.mapInit();
                                      Get.back();
                                    },
                                    child: Text(
                                      "Confirm",
                                      style: styleC(
                                        ColorTheme.primary,
                                        16,
                                        FontWeight.w400,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 5,
                      ),
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        color: ColorTheme.bg1.withOpacity(.6),
                      ),
                      padding: const EdgeInsets.all(13),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Restaurant contact details",
                            style: styleC(
                              ColorTheme.black,
                              20,
                              FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Name: ${controller.smapleOrderLi[0]['name']}",
                            style: styleC(
                              ColorTheme.black,
                              16,
                              FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Address: ${controller.smapleOrderLi[0]['address']}",
                            style: styleC(
                              ColorTheme.black,
                              16,
                              FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Order Type: ${controller.smapleOrderLi[0]['foodType']}",
                            style: styleC(
                              ColorTheme.black,
                              16,
                              FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Address : ${controller.smapleOrderLi[0]['addressRes']}",
                            style: styleC(
                              ColorTheme.black,
                              16,
                              FontWeight.w600,
                            ),
                          ),
                          controller.smapleOrderLi.length > 1
                              ? Center(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 5,
                                    ),
                                    width: 110,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(20),
                                      color: ColorTheme.bg1.withOpacity(.75),
                                    ),
                                    padding: const EdgeInsets.all(13),
                                    child: Obx(
                                      () => InkWell(
                                        onTap: () {
                                          controller.moreDet.value =
                                              !controller.moreDet.value;
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 5,
                                              ),
                                              child: Text(
                                                controller.moreDet.value
                                                    ? 'Less'
                                                    : "More",
                                                style: styleC(
                                                  ColorTheme.black,
                                                  16,
                                                  FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              controller.moreDet.value
                                                  ? Icons
                                                      .keyboard_arrow_up_rounded
                                                  : Icons
                                                      .keyboard_arrow_down_rounded,
                                              size: 20,
                                              color: ColorTheme.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                          Obx(
                            () => Visibility(
                              visible: controller.moreDet.value,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: controller.smapleOrderLi
                                        .sublist(
                                          1,
                                          controller.smapleOrderLi.length,
                                        )
                                        .map(
                                          (e) => Container(
                                            width: width - 20,
                                            padding: const EdgeInsets.all(8),
                                            margin: const EdgeInsets.only(
                                                bottom: 10),
                                            decoration: BoxDecoration(
                                              color: ColorTheme.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Name: ${e['name']}",
                                                  style: styleC(
                                                    ColorTheme.black,
                                                    16,
                                                    FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  "Address: ${e['address']}",
                                                  style: styleC(
                                                    ColorTheme.black,
                                                    16,
                                                    FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  "Order Type: ${e['foodType']}",
                                                  style: styleC(
                                                    ColorTheme.black,
                                                    16,
                                                    FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  "Address : ${e['addressRes']}",
                                                  style: styleC(
                                                    ColorTheme.black,
                                                    16,
                                                    FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                        .toList()),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      dividerColor: Colors.transparent,
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: ShapeDecoration(
                        color: ColorTheme.bg1.withOpacity(.3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: ExpansionTile(
                        title: Text(
                          "Cancel Order",
                          style: styleC(
                            ColorTheme.black,
                            20,
                            FontWeight.w600,
                          ),
                        ),
                        expandedAlignment: Alignment.topLeft,
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        childrenPadding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          left: 15,
                          right: 5,
                        ),
                        children: [
                          reasonWid("Wrong Address"),
                          reasonWid("Customer Not Available"),
                          reasonWid("Other")
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 5,
                      ),
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        color: ColorTheme.bg1.withOpacity(.3),
                      ),
                      padding: const EdgeInsets.all(13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.phone_android_rounded,
                            size: 20,
                            color: ColorTheme.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Text(
                              "Contact Customer Care",
                              style: styleC(
                                ColorTheme.black,
                                16,
                                FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
