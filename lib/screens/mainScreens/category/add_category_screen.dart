import 'package:flutter/material.dart';
import 'package:money_management_app/screens/subScreens/refactoring/container_shadow.dart';
import '../../subScreens/refactoring/styles.dart';
import 'category_popup.dart';
import 'expense_category_list.dart';
import 'income_category_list.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            backgroundColor: barColor,
            elevation: 0,
            title: const Text(
              "Category",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inder',
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showCategoryAddPopup(context);
            },
            backgroundColor: barColor,
            foregroundColor: white,
            child: const Icon(
              Icons.add_circle,
              size: 40,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(30.0)),
                  child: TabBar(
                    indicator: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: contShadow()),
                    labelColor: white,
                    overlayColor:
                        const MaterialStatePropertyAll(Colors.transparent),
                    unselectedLabelColor: graphBlue,
                    tabs: const [
                      Tab(
                        child: Text(
                          'Income',
                          style: TextStyle(
                            fontFamily: 'Inder',
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Expense',
                          style: TextStyle(
                            fontFamily: 'Inder',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                    child: TabBarView(
                  children: [
                    IncomeCategoryList(),
                    ExpenseCategoryList(),
                  ],
                ))
              ],
            ),
          )),
    );
  }
}
