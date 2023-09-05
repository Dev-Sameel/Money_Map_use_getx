import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_management_app/data_base/category/category_db.dart';
import 'package:money_management_app/data_base/transaction/transaction_db.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/category/category_model.dart';

class AmountsController extends GetxController {
  RxString username=''.obs;
  RxDouble income = 0.0.obs;
  RxDouble expense = 0.0.obs;
  RxDouble total = 0.0.obs;

  @override
  void onInit() {
     balanceAmount();
    CategoryDB.instance.refreshUI();
    TransactionDB.instance.refresh();
    autoLogIn();
    super.onInit();
  }

  void autoLogIn() async
  {
     WidgetsFlutterBinding.ensureInitialized();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    username.value = prefs.getString('nameKey').toString();
    
  }
  

  void balanceAmount() async {
    final transactions = await TransactionDB.instance.getAllTransaction();
    expense.value = 0;
    income.value = 0;
    total.value = 0;

    for (var item in transactions) {
      if (item.type == CategoryType.icome) {
        income.value += item.amount;
      } else {
        expense.value += item.amount;
      }
    }
    total.value = income.value - expense.value;
  }
}