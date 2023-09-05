import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/subScreens/welcomePage/bottom_nav.dart';
import '../screens/subScreens/welcomePage/onboarding.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    checkUserLoggedIn();
    super.onInit();
  }

  Future<void> gotoLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAll(() => const Onboarding());
  }

  Future<void> checkUserLoggedIn() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final userLogged = sharedPrefs.getString('nameKey');
    if (userLogged == null) {
      gotoLogin();
    } else {
      await Future.delayed(const Duration(seconds: 2));
      Get.offAll(() =>  BottomItemBar());
    }
  }
}