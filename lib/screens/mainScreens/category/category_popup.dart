import 'package:flutter/material.dart';
import 'package:money_management_app/screens/subScreens/refactoring/others.dart';

import '../../subScreens/refactoring/styles.dart';
import '../../../data_base/category/category_db.dart';
import '../../../models/category/category_model.dart';

ValueNotifier<CategoryType> selectedCategoryNotifier =
    ValueNotifier(CategoryType.icome);
Future<void> showCategoryAddPopup(BuildContext context) async {
  final nameEditingController = TextEditingController();
  showDialog(
      context: context, //this is the context of the screen
      builder: (ctx) {
        return SimpleDialog(
          title: const Text('Add Category'),
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 24, right: 30),
              padding: const EdgeInsets.only(left: 15),
              height: 38,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 207, 207, 207),
                    blurRadius: 15,
                    spreadRadius: 1,
                    offset: Offset(5, 5),
                  ),
                  BoxShadow(
                    color: Color.fromARGB(167, 255, 255, 255),
                    blurRadius: 15,
                    spreadRadius: 1,
                    offset: Offset(-5, -5),
                  ),
                ],
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                color: Colors.white,
              ),
              child: TextField(
                controller: nameEditingController,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: 'Category Name'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  RadioButton(title: 'Income', type: CategoryType.icome),
                  RadioButton(title: 'Expense', type: CategoryType.expense),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: const EdgeInsets.only(left: 35, right: 35),
                child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(bgColor)),
                  onPressed: () {
                    final name = nameEditingController.text;
                    if (name.isEmpty) {
                      return;
                    }
                    final type = selectedCategoryNotifier.value;
                    final category = CategoryModel(
                      id: DateTime.now().microsecond.toString(),
                      name: name,
                      type: type,
                    );
                    CategoryDB.instance.insertCategory(category);
                    Navigator.of(ctx).pop();
                    customSnakBar('Category Added Successfully', 'Success');
                  },
                  child: const Text('ADD'),
                ),
              ),
            )
          ],
        );
      });
}

class RadioButton extends StatelessWidget {
  final String title;
  final CategoryType type;

  const RadioButton({
    Key? key,
    required this.title,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
            valueListenable: selectedCategoryNotifier,
            builder: (BuildContext ctx, CategoryType newCategory, Widget? _) {
              return Radio<CategoryType>(
                  activeColor: bgColor,
                  value: type,
                  groupValue: newCategory,
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    selectedCategoryNotifier.value = value;
                    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                    selectedCategoryNotifier.notifyListeners();
                  });
            }),
        Text(title)
      ],
    );
  }
}
