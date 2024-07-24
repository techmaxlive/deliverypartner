import 'package:get/get.dart';

class AccountController extends GetxController {
  var listItem = <String>["Weekly", "Monthly", "Yearly"];
  var selectedItem = ''.obs;
  var isDropdownOpen = false.obs;

  var tableLi = [
    "Order Number",
    "Category",
    "Type of order",
    "Order Value",
    "Delivery Charge",
    "Payment Status"
  ];
  var tempTableDet = [
    {"1234", "Grocery", "COD", "800", "100", "Pending"},
    {"1234", "Grocery", "COD", "800", "90", "Received"},
    {"1234", "Grocery", "COD", "800", "60", "Received"},
  ];
}
