import 'package:deliverypartner/config/const_string.dart';
import 'package:deliverypartner/config/const_wid.dart';
import 'package:deliverypartner/controller/home_controller.dart';
import 'package:flutter/material.dart';

class HomeOrderSuccessWid extends StatelessWidget {
  final double height, width;
  final HomeController controller;
  const HomeOrderSuccessWid({
    super.key,
    required this.height,
    required this.width,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: ColorTheme.bg2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/success_1.png',
            height: 150,
            width: 150,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.1),
            child: Text(
              "Delivery Successful",
              style: styleC(
                Colors.black,
                16,
                FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
