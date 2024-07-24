import 'package:deliverypartner/config/const_string.dart';
import 'package:deliverypartner/config/const_wid.dart';
import 'package:deliverypartner/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String emaiId;
  const OTPVerificationScreen({
    super.key,
    required this.emaiId,
  });

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  var controller = Get.put(LoginController());
  @override
  void initState() {
    controller.startCountTown();
    super.initState();
  }

  @override
  void dispose() {
    controller.otpController.dispose();
    controller.focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var borderColor = ColorTheme.black.withOpacity(.5);
    final defaultPinTheme = PinTheme(
      width: 48,
      height: 48,
      textStyle: TextStyle(
        fontSize: 22,
        color: ColorTheme.black,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
        color: ColorTheme.pinBox,
      ),
    );
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
              "Verification",
              style: styleC(
                ColorTheme.black,
                24,
                FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                "Please type the verification code sent to",
                style: styleC(
                  ColorTheme.black,
                  14,
                  FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                widget.emaiId,
                style: styleC(
                  ColorTheme.black,
                  14,
                  FontWeight.w400,
                ),
              ),
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Pinput(
                controller: controller.otpController,
                focusNode: controller.focusNode,
                defaultPinTheme: defaultPinTheme,
                length: 4,
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (String verificationCode) {},
                onChanged: (code) {},
                cursor: const SizedBox.shrink(),
              ),
            ),
            InkWell(
              onTap: () async {
                if (controller.otpController.text.isEmpty) {
                  showToast('Enter valid OTP', context);
                } else if (controller.otpController.text.length != 4) {
                  showToast('Enter valid OTP 4 digit', context);
                } else {
                  await controller.verifyAPiCall(context, widget.emaiId);
                }
              },
              child: Container(
                height: 60,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 30, left: 20, right: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue[900]),
                child: Center(
                  child: Obx(
                    () => controller.loadingVerify.value
                        ? SizedBox(
                            height: 15,
                            width: 15,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: ColorTheme.white,
                            ),
                          )
                        : Text(
                            "Verify",
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
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Obx(
                () => Text(
                  controller.intToTimeLeft(controller.countdown.value),
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
