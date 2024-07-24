import 'package:deliverypartner/config/const_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: ConstString.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorTheme.primary,
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
