import 'package:deliverypartner/config/const_string.dart';
import 'package:deliverypartner/config/const_wid.dart';
import 'package:deliverypartner/controller/profile_controller.dart';
// import 'package:deliverypartner/view/screens/account/account_screen.dart';
import 'package:deliverypartner/view/screens/profile/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  var controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Widget itemWid(
      String leading,
      String title,
      bool trail,
      double radius,
    ) {
      return InkWell(
        onTap: () {
          if (title == 'Action Dashboard') {
            // Get.to(const AccountScreen());
          } else if (title == 'Log Out') {
            controller.modalBottomLogoutAlert(context, height, width);
          }
        },
        child: Container(
          padding: EdgeInsets.all(width * 0.05),
          margin: EdgeInsets.only(bottom: height * 0.006),
          decoration: BoxDecoration(
            color: ColorTheme.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(radius),
              topLeft: Radius.circular(radius),
            ),
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/images/$leading',
                height: 24,
                width: 24,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    title,
                    style: styleC(
                      ColorTheme.black,
                      16,
                      FontWeight.w600,
                    ),
                  ),
                ),
              ),
              trail
                  ? Icon(
                      Icons.keyboard_arrow_right_outlined,
                      size: 20,
                      color: ColorTheme.primary,
                    )
                  : const SizedBox.shrink()
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: ColorTheme.primary,
      appBar: AppBar(
        backgroundColor: ColorTheme.primary,
        surfaceTintColor: ColorTheme.primary,
        toolbarHeight: height * 0.11,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: InkWell(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back_rounded,
              size: 22,
              color: ColorTheme.white,
            ),
          ),
        ),
        leadingWidth: 30,
        title: Text(
          "Profile",
          style: styleC(
            ColorTheme.white,
            18,
            FontWeight.w600,
          ),
        ),
        actions: [
          Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15),
              color: ColorTheme.white,
            ),
            child: Center(
              child: Image.asset(
                'assets/images/noti_icon.png',
                height: 20,
                width: 20,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: width,
            height: height,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height - height * 0.3,
              decoration: BoxDecoration(
                color: ColorTheme.pinBox,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemWid(
                    'star_border_24dp_5F6368 1.png',
                    'Action Dashboard',
                    true,
                    20,
                  ),
                  itemWid(
                    'rocket_launch_24dp_5F6368 1.png',
                    'Check App Update',
                    true,
                    0,
                  ),
                  itemWid(
                    'help_1.png',
                    'Help',
                    true,
                    0,
                  ),
                  itemWid(
                    'lock_24dp_5F6368 1.png',
                    'Privacy Policy',
                    false,
                    0,
                  ),
                  itemWid(
                    'phone_iphone_24dp_5F6368 1.png',
                    'Contact Customer Care',
                    false,
                    0,
                  ),
                  itemWid(
                    'power_settings_new_24dp_5F6368 1.png',
                    'Log Out',
                    false,
                    0,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: width * 0.020,
            right: width * 0.020,
            child: Container(
              width: width,
              margin: EdgeInsets.only(
                left: width * 0.020,
                right: width * 0.020,
                top: height * 0.01,
                bottom: height * 0.01,
              ),
              padding: EdgeInsets.all(width * 0.025),
              decoration: BoxDecoration(
                color: ColorTheme.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      "assets/images/animoji.png",
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: width * 0.02,
                        right: width * 0.02,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Steve Smit",
                            style: styleC(
                              ColorTheme.black,
                              16,
                              FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "SmitS123@mail.com",
                                    style: styleC(
                                      ColorTheme.black,
                                      14,
                                      FontWeight.w400,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(const EditMyProfile());
                                  },
                                  child: Text(
                                    "Edit",
                                    style: styleC(
                                      ColorTheme.primary,
                                      14,
                                      FontWeight.w400,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              "+91 - 97234567894",
                              style: styleC(
                                ColorTheme.black,
                                14,
                                FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
