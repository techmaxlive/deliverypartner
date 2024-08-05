import 'package:deliverypartner/config/const_string.dart';
import 'package:deliverypartner/config/const_wid.dart';
import 'package:deliverypartner/config/storage_utils.dart';
import 'package:deliverypartner/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:get/get.dart';

class HomeAcceptOrderWid extends StatelessWidget {
  final double height, width;
  final HomeController controller;
  const HomeAcceptOrderWid({
    super.key,
    required this.height,
    required this.width,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    Widget txtRow(String title, String ans) {
      return Padding(
        padding: EdgeInsets.only(
          left: width * 0.245,
          bottom: height * 0.005,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: styleC(
                  ColorTheme.black,
                  12,
                  FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Text(
                ans,
                style: styleC(
                  ColorTheme.black,
                  12,
                  FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      );
    }

    return SizedBox(
      width: width,
      height: height,
      child: Column(
        children: [
          Container(
            color: ColorTheme.bg1.withOpacity(.17),
            width: width,
            height: height - height * 0.25,
            margin: EdgeInsets.all(width * 0.01),
            padding: EdgeInsets.only(top: height * 0.1),
            child: Obx(
              () => Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: height * 0.03),
                    child: Text(
                      "Customer contact details",
                      style: styleC(
                        ColorTheme.black,
                        16,
                        FontWeight.w600,
                      ),
                    ),
                  ),
                  txtRow('Name',
                      ': ${controller.listOrder.first.order.shippingAddress.customerName}'),
                  txtRow('Address',
                      ': ${controller.listOrder.first.order.shippingAddress.addressLine1}, ${controller.listOrder.first.order.shippingAddress.city}, ${controller.listOrder.first.order.shippingAddress.state}'),
                  txtRow('Order Type', ': Cash on delivery'),
                  const Spacer(),
                  Image.asset(
                    'assets/images/Motocycle.png',
                    height: width * 0.8,
                    width: width * 0.8,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: width,
            height: height * 0.13,
            child: Row(
              children: [
                InkWell(
                  onTap: () async {
                    dynamic result = await controller.orderAcceptOrDenied(
                        context,
                        int.parse(controller.listOrder.first.id),
                        false);
                    if (result == null) {
                      FlutterToastr.show(result['message'].toString(), context);
                    } else {
                      controller.screen.value = 'No Order';
                      await controller.mapInit();
                    }
                  },
                  child: Container(
                    width: width * .4,
                    margin: EdgeInsets.symmetric(
                      horizontal: width * 0.035,
                      vertical: height * 0.03,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          ColorTheme.r1.withOpacity(.98),
                          ColorTheme.r1.withOpacity(.61),
                          ColorTheme.r1.withOpacity(.98),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Obx(
                        () => controller.loadingRefresh.value
                            ? SizedBox(
                                height: 15,
                                width: 15,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: ColorTheme.white,
                                ),
                              )
                            : Text(
                                "Deny",
                                style: styleC(
                                  ColorTheme.white,
                                  16,
                                  FontWeight.w400,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    dynamic result = await controller.orderAcceptOrDenied(
                      context,
                      int.parse(controller.listOrder.first.id),
                      true,
                    );
                    if (result == null) {
                      MySharedPreferences()
                          .setOrderIdkey(controller.listOrder.first.id);
                      FlutterToastr.show(result['message'].toString(), context);
                    } else {
                      FlutterToastr.show(result['message'].toString(), context);
                      if (result['message'] != 'No Data') {
                        controller.screen.value = 'Map Screen';
                        await controller.mapInit();
                      }
                    }
                  },
                  child: Container(
                    width: width * .4,
                    margin: EdgeInsets.symmetric(
                      horizontal: width * 0.035,
                      vertical: height * 0.03,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        // stops: [0.1, 0.5, 0.7, 0.9],
                        colors: [
                          ColorTheme.g1,
                          ColorTheme.g2.withOpacity(.79),
                          ColorTheme.g3,
                        ],
                      ),
                    ),
                    child: Center(
                      child: Obx(
                        () => controller.loadingRefresh.value
                            ? SizedBox(
                                height: 15,
                                width: 15,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: ColorTheme.white,
                                ),
                              )
                            : Text(
                                "Accept",
                                style: styleC(
                                  ColorTheme.white,
                                  16,
                                  FontWeight.w400,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
