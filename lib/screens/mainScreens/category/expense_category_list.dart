import 'package:flutter/material.dart';
import 'package:money_management_app/data_base/category/category_db.dart';
import '../../subScreens/refactoring/styles.dart';
import 'package:money_management_app/screens/mainScreens/category/category_lists.dart';

class ExpenseCategoryList extends StatelessWidget {
  const ExpenseCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CategoryDB().expenseCategoryListListener,
      builder: categoryItems(context,graphBlue),
    );
  }
}
