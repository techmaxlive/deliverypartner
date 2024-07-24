import 'package:deliverypartner/config/const_string.dart';
import 'package:deliverypartner/config/const_wid.dart';
import 'package:deliverypartner/config/storage_utils.dart';
import 'package:deliverypartner/view/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var fnameController = TextEditingController();
  var lnameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var addressController = TextEditingController();
  var emgController = TextEditingController();
  modalBottomLogoutAlert(
      BuildContext context, double height, double width) async {
    showModalBottomSheet(
      context: context,
      backgroundColor: ColorTheme.white,
      isDismissible: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      builder: (builder) {
        return SizedBox(
          width: width,
          height: height * 0.22,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(width * 0.07),
                    child: Text(
                      "Are you sure you want to\nLogout?",
                      textAlign: TextAlign.center,
                      style: styleC(ColorTheme.black, 17, FontWeight.w600),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: height * 01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          bool result = await MySharedPreferences().clearData();
                          if (result) {
                            Get.offAll(const SplashScreen());
                          }
                        },
                        child: Container(
                          width: width * 0.35,
                          padding: EdgeInsets.all(width * 0.02),
                          margin: EdgeInsets.all(width * 0.02),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: ColorTheme.primary,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: Text(
                              'Yes, I want to',
                              textAlign: TextAlign.center,
                              style:
                                  styleC(ColorTheme.white, 15, FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: width * 0.35,
                          padding: EdgeInsets.all(width * 0.02),
                          margin: EdgeInsets.all(width * 0.02),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: ColorTheme.white,
                            border: Border.all(
                              width: 1,
                              color: ColorTheme.primary,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: Text(
                              'No, I’m fine',
                              textAlign: TextAlign.center,
                              style:
                                  styleC(ColorTheme.black, 15, FontWeight.w600),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
