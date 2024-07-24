import 'package:deliverypartner/config/storage_utils.dart';
import 'package:deliverypartner/view/screens/home/home_screen.dart';
import 'package:deliverypartner/view/screens/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  var isLogin = false.obs;
  var prefs = SharedPreferences.getInstance();
  var loading = false.obs;
  Future checkLogin() async {
    loading(true);
    try {
      await Future.delayed(const Duration(seconds: 3));
      loading(false);
      if (await MySharedPreferences().getIsLogin()) {
        Get.offAll(const HomeScreen());
      } else {
        Get.offAll(const LoginScreen());
      }
    } catch (e) {
      print(e);
    }
  }
}
