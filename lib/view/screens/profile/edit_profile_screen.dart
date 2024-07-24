import 'package:deliverypartner/config/const_string.dart';
import 'package:deliverypartner/config/const_wid.dart';
import 'package:deliverypartner/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'input_field_wid.dart';

class EditMyProfile extends StatefulWidget {
  const EditMyProfile({super.key});

  @override
  State<EditMyProfile> createState() => _EditMyProfileState();
}

class _EditMyProfileState extends State<EditMyProfile> {
  var controller = Get.put(ProfileController());
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
              Icons.arrow_back_rounded,
              size: 22,
              color: ColorTheme.black,
            ),
          ),
        ),
        leadingWidth: 30,
        title: Text(
          "Profile",
          style: styleC(
            ColorTheme.black,
            18,
            FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  const SizedBox(
                    width: 120,
                    height: 120,
                  ),
                  Positioned(
                    top: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: Image.asset(
                        "assets/images/wrapper.png",
                        height: 110,
                        width: 110,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 15,
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: ColorTheme.black,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            InputFieldWid(
              title: "First Name",
              controller: controller.fnameController,
              keyboardType: TextInputType.text,
              width: width,
              height: height,
            ),
            InputFieldWid(
              title: "Last Name",
              controller: controller.lnameController,
              keyboardType: TextInputType.text,
              width: width,
              height: height,
            ),
            InputFieldWid(
              title: "Mobile Number",
              controller: controller.phoneController,
              keyboardType: TextInputType.phone,
              width: width,
              height: height,
            ),
            InputFieldWid(
              title: "Email",
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
              width: width,
              height: height,
            ),
            InputFieldWid(
              title: "Address",
              controller: controller.addressController,
              keyboardType: TextInputType.streetAddress,
              width: width,
              height: height,
            ),
            InputFieldWid(
              title: "Emergency Contact Number",
              controller: controller.emgController,
              keyboardType: TextInputType.phone,
              width: width,
              height: height,
            )
          ],
        ),
      ),
    );
  }
}
