import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:money_management_app/data_base/balance/balance_db.dart';
import 'package:money_management_app/data_base/category/category_db.dart';
import 'package:money_management_app/data_base/graph/chart.dart';
import 'package:money_management_app/data_base/transaction/transaction_db.dart';
import 'package:money_management_app/screens/subScreens/refactoring/others.dart';
import '../../subScreens/refactoring/styles.dart';
import 'package:money_management_app/screens/subScreens/refactoring/container_shadow.dart';
import 'package:money_management_app/screens/subScreens/refactoring/date_picker2.dart';
import 'package:money_management_app/screens/subScreens/refactoring/decoration.dart';
import '../../../models/category/category_model.dart';
import '../../../models/transaction/transaction_model.dart';

class EditTransaction extends StatefulWidget {
  final AmountsController hController=Get.find();
   EditTransaction({super.key, required this.model});
  final TransactionModel model;

  @override
  State<EditTransaction> createState() => _EditTransactionState();
}

class _EditTransactionState extends State<EditTransaction> {
  DateTime? _selectedDate;
  CategoryType? _selectedCategorytype;
  CategoryModel? _selectedCategoryModel;
  String? _categoryID;

  final purposeTextEditingController = TextEditingController();
  final amountTextEditingController = TextEditingController();

  @override
  void initState() {
    _selectedCategorytype = CategoryType.icome;
    purposeTextEditingController.text = widget.model.purpose;
    amountTextEditingController.text = widget.model.amount.toString();
    _selectedDate = widget.model.date;
    _selectedCategorytype = widget.model.type;
    _selectedCategoryModel = widget.model.category;
    _categoryID = widget.model.category.id;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double contheight = height * 0.77;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
        title: const Text(
          'Edit Transaction',
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.w500,
              fontSize: 18),
        ),
        centerTitle: true,
      ),
      backgroundColor: bgColor,
      body: ScrollConfiguration(
        behavior: RemoveGlow(),
        child: ListView(
          children: [
            Container(
              height: contheight,
              margin: const EdgeInsets.only(right: 30, left: 30, top: 30),
              decoration: containerShadow(BorderRadius.circular(10)),
              child: Stack(
                children: [
                  const Image(image: AssetImage('assets/images/balls.png')),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Radio(
                                  activeColor: white,
                                  fillColor: const MaterialStatePropertyAll(white),
                                  value: CategoryType.icome,
                                  groupValue: _selectedCategorytype,
                                  onChanged: (newvalue) {
                                    setState(() {
                                      _selectedCategorytype =
                                          CategoryType.icome;
                                      _categoryID = null;
                                    });
                                  },
                                ),
                                const Text('Income',
                                    style: TextStyle(color: white)),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  activeColor: white,
                                  fillColor: const MaterialStatePropertyAll(white),
                                  value: CategoryType.expense,
                                  groupValue: _selectedCategorytype,
                                  onChanged: (newvalue) {
                                    setState(() {
                                      _selectedCategorytype =
                                          CategoryType.expense;
                                      _categoryID = null;
                                    });
                                  },
                                ),
                                const Text('Expense',
                                    style: TextStyle(color: white)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      sizeBox15(height),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Category',
                            style: textSTYL2,
                          ),
                          sizeBox7(height),
                          Container(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              width: width * 0.7,
                              height: height * 0.07,
                              decoration: customBoxBorder(),
                              child: Center(
                                child: DropdownButtonFormField<String>(
                                  borderRadius: BorderRadius.circular(20),
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide.none),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide.none),
                                  ),
                                  dropdownColor: Colors.teal,
                                  value: _categoryID,
                                  items: (_selectedCategorytype ==
                                              CategoryType.icome
                                          ? CategoryDB.instance
                                              .incomeCategoryListListener
                                          : CategoryDB.instance
                                              .expenseCategoryListListener)
                                      .value
                                      .map((e) {
                                    return DropdownMenuItem(
                                      value: e.id,
                                      child: Text(
                                        e.name,
                                        style: const TextStyle(color: white),
                                      ),
                                      onTap: () {
                                        _selectedCategoryModel = e;
                                      },
                                    );
                                  }).toList(),
                                  onChanged: (selectedValue) {
                                    setState(() {
                                      _categoryID = selectedValue;
                                    });
                                  },
                                  hint: Text(
                                    (_selectedCategoryModel!.name),
                                    style: const TextStyle(color: expenseColor),
                                  ),
                                ),
                              )),
                          sizeBox25(height),
                          const Text('Notes', style: textSTYL2),
                          sizeBox7(height),
                          Container(
                              width: width * 0.7,
                              height: height * 0.07,
                              decoration: customBoxBorder(),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: InputDecor(
                                      controller: purposeTextEditingController,
                                      textInputType: TextInputType.text,
                                      hintText: 'Enter Notes'),
                                ),
                              )),
                          sizeBox25(height),
                          const Text('Amount', style: textSTYL2),
                          sizeBox7(height),
                          Container(
                              width: width * 0.7,
                              height: height * 0.07,
                              decoration: customBoxBorder(),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: InputDecor(
                                      controller: amountTextEditingController,
                                      textInputType: TextInputType.number,
                                      hintText: 'Enter Amount'),
                                ),
                              )),
                          sizeBox25(height),
                          const Text('Date', style: textSTYL2),
                          sizeBox7(height),
                          Container(
                              width: width * 0.7,
                              height: height * 0.07,
                              decoration: customBoxBorder(),
                              child: TextButton.icon(
                                style: const ButtonStyle(
                                    foregroundColor:
                                        MaterialStatePropertyAll(white),
                                    overlayColor: MaterialStatePropertyAll(
                                        Colors.transparent)),
                                onPressed: () async {
                                  final selectedDateTemp =
                                      await datePicker2(context);
                                  if (selectedDateTemp == null) {
                                    return;
                                  } else {
                                    setState(() {
                                      _selectedDate = selectedDateTemp;
                                    });
                                  }
                                },
                                icon: const Icon(Icons.calendar_today),
                                label: Text(
                                  _selectedDate == null
                                      ? 'Select Date'
                                      : DateFormat("dd-MMMM-yyyy")
                                          .format(_selectedDate!),
                                ),
                              )),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: width * 0.25,
                        height: height * 0.055,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                              gradient: buttonGradient),
                          child: ElevatedButton(
                            style: const ButtonStyle(
                                shadowColor: MaterialStatePropertyAll(
                                    Colors.transparent),
                                elevation: MaterialStatePropertyAll(10),
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.transparent),
                                overlayColor: MaterialStatePropertyAll(
                                    Colors.transparent)),
                            onPressed: () {
                              editTransaction();
                            },
                            child: const Text('Update'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> editTransaction() async {
    final purposeText = purposeTextEditingController.text.trim();
    final amountText = amountTextEditingController.text.trim();

    if (purposeText.isEmpty) {
      return;
    }
    if (amountText.isEmpty) {
      return;
    }
    if (_categoryID == null) {
      return;
    }
    if (_selectedDate == null) {
      return;
    }
    if (_selectedCategoryModel == null) {
      return;
    }
    final parsedAmount = double.tryParse(amountText);
    if (parsedAmount == null) {
      return;
    }

    final model = TransactionModel(
        purpose: purposeText,
        amount: parsedAmount,
        date: _selectedDate!,
        type: _selectedCategorytype!,
        category: _selectedCategoryModel!,
        id: widget.model.id);
    await TransactionDB.instance.editTransaction(model);
    Get.back();
    filterFunction();
    await TransactionDB.instance.refresh();
    widget.hController.balanceAmount();
    customSnakBar('Transaction updated Successfully', 'Success');
  }
}
