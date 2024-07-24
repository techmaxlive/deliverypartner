import 'package:deliverypartner/config/const_string.dart';
import 'package:deliverypartner/config/const_wid.dart';
import 'package:deliverypartner/controller/home_controller.dart';
import 'package:deliverypartner/view/screens/profile/my_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'accept_order_wid.dart';
import 'no_order_wid.dart';
import 'list_order_wid.dart';
import 'order_map_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorTheme.white,
      appBar: AppBar(
        backgroundColor: ColorTheme.white,
        surfaceTintColor: ColorTheme.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: InkWell(
            onTap: () => Get.back(),
            child: Icon(
              Icons.home_filled,
              size: 22,
              color: ColorTheme.black,
            ),
          ),
        ),
        leadingWidth: 30,
        title: Text(
          "Home",
          style: styleC(
            ColorTheme.black,
            16,
            FontWeight.w600,
          ),
        ),
        actions: [
          Image.asset(
            'assets/images/noti_icon.png',
            height: 20,
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 5),
            child: InkWell(
              onTap: () {
                Get.to(const MyProfileScreen());
              },
              child: Image.asset(
                'assets/images/animoji.png',
                height: 40,
                width: 40,
              ),
            ),
          )
        ],
      ),
      body: Obx(
        () => controller.screen.value == 'Accept Page'
            ? HomeAcceptOrderWid(
                height: height,
                width: width,
                controller: controller,
              )
            : controller.screen.value == 'Map Screen'
                ? HomeOrderMapWid(
                    height: height,
                    width: width,
                    controller: controller,
                  )
                : controller.screen.value == 'List Order'
                    ? ListOrderWid(
                        height: height,
                        width: width,
                        controller: controller,
                      )
                    : HomeNoOrderWid(
                        height: height,
                        width: width,
                        controller: controller,
                      ),
      ),
    );
  }
}
