import 'package:deliverypartner/config/const_string.dart';
import 'package:deliverypartner/config/const_wid.dart';
import 'package:deliverypartner/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  margin: const EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                  ),
                )
              ],
            ),
            Text(
              "Welcome",
              style: styleC(
                ColorTheme.black,
                24,
                FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 15),
              child: Text(
                "Enter your phone number and Email to login",
                style: styleC(
                  ColorTheme.txtClr,
                  14,
                  FontWeight.normal,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 15),
              child: TextField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  hintText: "Enter Email id",
                  filled: true,
                  fillColor: Colors.blue[50],
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Colors.blue,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  constraints: const BoxConstraints(
                    maxHeight: 50,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue.shade100),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                if (controller.loadingROTP.value) {
                  showToast('Waiting for API Response', context);
                } else if (controller.emailController.text.isEmpty) {
                  showToast('Enter valid email', context);
                } else {
                  await controller.loginAPiCall(context);
                }
              },
              child: Container(
                height: 50,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 30, left: 20, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blue[900],
                ),
                child: Center(
                  child: Obx(
                    () => controller.loadingROTP.value
                        ? SizedBox(
                            height: 15,
                            width: 15,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: ColorTheme.white,
                            ),
                          )
                        : Text(
                            "Continue",
                            style: styleC(
                              ColorTheme.white,
                              16,
                              FontWeight.w400,
                            ),
                          ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
