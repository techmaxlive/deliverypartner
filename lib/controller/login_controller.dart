import 'dart:async';

import 'package:deliverypartner/config/const_string.dart';
import 'package:deliverypartner/config/const_wid.dart';
import 'package:deliverypartner/config/storage_utils.dart';
import 'package:deliverypartner/view/screens/home/home_screen.dart';
import 'package:deliverypartner/view/screens/login/verification_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController();
  var otpController = TextEditingController();
  final focusNode = FocusNode();
  //final formKey = GlobalKey<FormState>();
  var countdown = 300.obs;
  final dio = Dio();
  var loadingROTP = false.obs;
  var loadingVerify = false.obs;
  var prefs = SharedPreferences.getInstance();
  Future<void> loginAPiCall(BuildContext context) async {
    try {
      loadingROTP(true);
      Map<String, dynamic> data = {"emailId": emailController.text};
      final response = await dio.post(
        ConstString.createotp,
        data: data,
      );
      if (response.statusCode == 200 && response.data['status'] == 'success') {
        var result = response.data;
        print(result);
        MySharedPreferences().setEmailkey(emailController.text);
        MySharedPreferences().setContentkey(result['content']);
        showToast(result['message'], context);
        loadingROTP(false);
        Get.to(
          OTPVerificationScreen(
            emaiId: emailController.text,
          ),
        )!
            .then((value) => emailController.clear());
      } else {
        loadingROTP(false);
        showToast('API call failed: ${response.statusMessage}', context);
      }
    } catch (e) {
      loadingROTP(false);
      showToast('API call failed: Network error occurred: $e', context);
    }
  }

  Future verifyAPiCall(BuildContext context, String email) async {
    try {
      loadingVerify(true);
      Map<String, dynamic> data = {
        "otp": otpController.text,
        "emailId": email,
      };
      final response = await dio.post(
        ConstString.validateotp,
        data: data,
      );
      if (response.statusCode == 200 && response.data['status'] == 'success') {
        MySharedPreferences().setEmailkey(response.data['content']['token']);
        MySharedPreferences().setLogin(response.data['status'] == 'success');
        loadingVerify(false);
        var result = response.data;
        showToast(result['message'], context);
        Get.offAll(const HomeScreen());
      } else {
        loadingVerify(false);
        showToast('API call failed: ${response.statusMessage}', context);
      }
    } catch (e) {
      loadingVerify(false);
      showToast('API call failed: Network error occurred: $e', context);
    }
  }

  Future startCountTown() async {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value != 0) {
        countdown--;
      }
    });
  }

  String intToTimeLeft(int value) {
    int h, m, s;

    h = value ~/ 3600;

    m = ((value - h * 3600)) ~/ 60;

    s = value - (h * 3600) - (m * 60);

    String result = s < 10 ? "0$m:0$s" : "0$m:$s";

    return result;
  }
}
