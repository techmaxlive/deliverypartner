import 'package:deliverypartner/config/const_string.dart';
import 'package:deliverypartner/config/const_wid.dart';
import 'package:deliverypartner/controller/home_controller.dart';
import 'package:flutter/material.dart';

class OrderWid extends StatelessWidget {
  final dynamic orderData;
  final HomeController controller;
  const OrderWid({super.key, this.orderData, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.only(bottom: 5),
      height: 135,
      decoration: BoxDecoration(
        color: ColorTheme.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Order Id : ${orderData['id']}",
                  style: styleC(
                    ColorTheme.black,
                    12,
                    FontWeight.w600,
                  ),
                ),
                Text(
                  "Order Date : ${orderData['date']}",
                  style: styleC(
                    ColorTheme.black,
                    12,
                    FontWeight.w600,
                  ),
                ),
                Text(
                  "Order Time : ${orderData['time']}",
                  style: styleC(
                    ColorTheme.black,
                    12,
                    FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 8, bottom: 8, right: 80),
                  decoration: BoxDecoration(
                    color: ColorTheme.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "View Details",
                      style: styleC(
                        ColorTheme.white,
                        12,
                        FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Order Type : ${orderData['orderType']}",
                  style: styleC(
                    ColorTheme.black,
                    12,
                    FontWeight.w600,
                  ),
                ),
                const Spacer(),
                orderData['status'] == 'delivered'
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_circle,
                              size: 20,
                              color: ColorTheme.green,
                            ),
                            Expanded(
                              child: Text(
                                "Successfully Deliverred ",
                                style: styleC(
                                  ColorTheme.black,
                                  12,
                                  FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : InkWell(
                        onTap: () async {
                          controller.screen.value = 'Map Screen';
                          await controller.mapInit();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: ColorTheme.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Location",
                                style: styleC(
                                  ColorTheme.white,
                                  12,
                                  FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.map,
                                size: 20,
                                color: ColorTheme.white,
                              )
                            ],
                          ),
                        ),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
