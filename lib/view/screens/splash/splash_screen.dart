import 'package:deliverypartner/config/const_string.dart';
import 'package:deliverypartner/controller/spalsh_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var controller = Get.put(SplashController());
  @override
  void initState() {
    controller.checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorTheme.white,
      body: SizedBox(
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const FlutterLogo(
              size: 70,
            ),
            Container(
              height: 25,
              width: 25,
              margin: const EdgeInsets.only(top: 25),
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: ColorTheme.primary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
