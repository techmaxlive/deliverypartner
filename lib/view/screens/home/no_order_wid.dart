import 'package:deliverypartner/config/const_string.dart';
import 'package:deliverypartner/config/const_wid.dart';
import 'package:deliverypartner/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeNoOrderWid extends StatelessWidget {
  final double height, width;
  final HomeController controller;
  const HomeNoOrderWid({
    super.key,
    required this.height,
    required this.width,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        children: [
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/boy-scooter-base.png',
                height: width * 0.8,
                width: width * 0.5,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(width * 0.05),
                  child: Text(
                    " FAST\nDELIVERY",
                    textAlign: TextAlign.end,
                    style: styleC(
                      ColorTheme.txt2,
                      32,
                      FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.all(width * 0.05),
              child: Text(
                "You will get a\nnotification after order\nassign then click on\nrefresh to get orders",
                textAlign: TextAlign.end,
                style: styleC1(
                  ColorTheme.txt1,
                  20,
                  FontWeight.w500,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              controller.screen.value = 'Accept Page';
              await controller.mapInit();
            },
            child: Container(
              height: height * 0.07,
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: width * 0.035,
                vertical: height * 0.03,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blue[900]),
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
                          "Refresh",
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
    );
  }
}
