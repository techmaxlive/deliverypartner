import 'package:deliverypartner/config/const_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';

styleC(Color clr, double fs, FontWeight fw) {
  return TextStyle(
    color: clr,
    fontFamily: ConstString.fontFamily,
    fontSize: fs,
    fontStyle: FontStyle.normal,
    fontWeight: fw,
  );
}

styleC1(Color clr, double fs, FontWeight fw) {
  return TextStyle(
    color: clr,
    fontFamily: ConstString.fontFamily,
    fontSize: fs,
    fontStyle: FontStyle.normal,
    fontWeight: fw,
    height: 2,
    letterSpacing: 3,
  );
}

showToast(String msg, BuildContext context) {
  return FlutterToastr.show(
    msg,
    context,
  );
}
