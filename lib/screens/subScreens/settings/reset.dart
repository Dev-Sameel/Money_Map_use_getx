import 'package:get/get.dart';
import 'package:money_management_app/screens/subScreens/welcomePage/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data_base/category/category_db.dart';
import '../../../data_base/graph/chart.dart';
import '../../../data_base/transaction/transaction_db.dart';

class ResetMMController extends GetxController {
  Future<void> resetMM() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.clear();
    TransactionDB.instance.clearAllData();
    CategoryDB.instance.clearAllData();
    clearGraphAllData();
    Get.offAll(const Onboarding());
  }
}
