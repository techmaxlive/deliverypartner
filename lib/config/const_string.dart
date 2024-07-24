import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorTheme {
  static var primary = const Color(0xff004AAD);
  static var black = Colors.black;
  static var txtClr = const Color(0xff212121);
  static var white = Colors.white;
  static var pinBox = const Color(0xffEBF4FF);
  static var green = const Color(0xff00AD1C);
  static var bg1 = const Color(0xffC1DDFF);
  static var txt1 = const Color(0xff655a42);
  static var txt2 = const Color(0xff45446C);

  static var g1 = const Color(0xff148935);
  static var g2 = const Color(0xff0F802E);
  static var g3 = const Color(0xff087627);
  static var r1 = const Color(0xffC20909);

  static var b1 = const Color(0xff67A6F0);
  static var b2 = const Color(0xffC8CCEC);

  static var inputbg = const Color(0xffF5F5F5);
  static var bg2 = const Color(0xffEDF4FF);
}

class ConstString {
  static var appName = 'Delivery Partner';
  static var fontFamily = GoogleFonts.inder().fontFamily;
  static var mapkey = "AIzaSyDMibHlhgviqy5wP43TFyhty0R3VAdzdmM";

  static var root = "http://192.168.11.145:8082/security/registration";
  static var createotp = '$root/deliveryAgent/sendOtp';
  static var validateotp = '$root/deliverAgent/otp/validation';
}
