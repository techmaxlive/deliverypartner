import 'package:deliverypartner/config/const_string.dart';
import 'package:deliverypartner/controller/home_controller.dart';
import 'package:deliverypartner/view/screens/home/order_wid.dart';
import 'package:flutter/material.dart';

class ListOrderWid extends StatelessWidget {
  final double height, width;
  final HomeController controller;
  const ListOrderWid(
      {super.key,
      required this.height,
      required this.width,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        color: ColorTheme.bg1.withOpacity(.47),
        margin: const EdgeInsets.all(10),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.smapleOrderLi.length,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(5),
          itemBuilder: (context, index) {
            var data = controller.smapleOrderLi[index];
            return OrderWid(
              orderData: data,
              controller: controller,
            );
          },
        ),
      ),
    );
  }
}
