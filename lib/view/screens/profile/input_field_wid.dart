import 'package:deliverypartner/config/const_string.dart';
import 'package:deliverypartner/config/const_wid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputFieldWid extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final double width;
  final double height;
  const InputFieldWid({
    super.key,
    required this.title,
    required this.controller,
    required this.keyboardType,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    border() {
      return const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.zero,
      );
    }

    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
        left: 25,
        right: 25,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              title,
              style: styleC(
                ColorTheme.black,
                11,
                FontWeight.w500,
              ),
            ),
          ),
          Container(
            color: ColorTheme.inputbg,
            height: height * 0.06,
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              maxLength: (title == 'Mobile Number' ||
                      title == 'Emergency Contact Number')
                  ? 10
                  : null,
              inputFormatters: (title == 'Mobile Number' ||
                      title == 'Emergency Contact Number')
                  ? [FilteringTextInputFormatter.digitsOnly]
                  : null,
              style: styleC(
                ColorTheme.black,
                12,
                FontWeight.w500,
              ),
              decoration: InputDecoration(
                border: border(),
                errorBorder: border(),
                enabledBorder: border(),
                focusedBorder: border(),
                disabledBorder: border(),
                focusedErrorBorder: border(),
                counter: const Offstage(),
                constraints: BoxConstraints(
                  minWidth: width - 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
