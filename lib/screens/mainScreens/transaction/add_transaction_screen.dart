import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:money_management_app/data_base/balance/balance_db.dart';
import 'package:money_management_app/data_base/category/category_db.dart';
import 'package:money_management_app/data_base/graph/chart.dart';
import 'package:money_management_app/data_base/transaction/transaction_db.dart';
import 'package:money_management_app/models/category/category_model.dart';
import 'package:money_management_app/models/transaction/transaction_model.dart';
import 'package:money_management_app/screens/mainScreens/category/category_popup.dart';
import 'package:money_management_app/screens/subScreens/refactoring/container_shadow.dart';
import 'package:money_management_app/screens/subScreens/refactoring/date_picker2.dart';
import 'package:money_management_app/screens/subScreens/refactoring/decoration.dart';
import 'package:money_management_app/screens/subScreens/refactoring/others.dart';
import 'package:money_management_app/screens/subScreens/refactoring/styles.dart';

class AddTransaction extends StatefulWidget {
  final AmountsController hController=Get.find();
   AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  
  DateTime? _selectedDate;
  CategoryType? _selectedCategoryType;
  CategoryModel? _selectedCategoryModel;
  String? _categoryId;

  final _notesController = TextEditingController();
  final _amountController = TextEditingController();
 
  @override
  void initState() {
    _selectedCategoryType = CategoryType.icome;
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
          'Add Transaction',
          style: TextStyle(
              color: white, fontWeight: FontWeight.w500, fontSize: 18),
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
              margin: const EdgeInsets.only(right: 30, left: 30, top: 20),
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
                            Radio(
                              activeColor: white,
                              fillColor: const MaterialStatePropertyAll(white),
                              value: CategoryType.icome,
                              groupValue: _selectedCategoryType,
                              onChanged: (newvalue) {
                                setState(() {
                                  _selectedCategoryType = CategoryType.icome;
                                  _categoryId = null;
                                });
                              },
                            ),
                            const Text(
                              'Income',
                              style: TextStyle(color: white),
                            ),
                            Row(
                              children: [
                                Radio(
                                  activeColor: white,
                                  fillColor:
                                      const MaterialStatePropertyAll(white),
                                  value: CategoryType.expense,
                                  groupValue: _selectedCategoryType,
                                  onChanged: (newvalue) {
                                    setState(() {
                                      _selectedCategoryType =
                                          CategoryType.expense;
                                      _categoryId = null;
                                    });
                                  },
                                ),
                                const Text(
                                  'Expense',
                                  style: TextStyle(color: white),
                                ),
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
                              padding: const EdgeInsets.only(left: 10),
                              width: width * 0.7,
                              height: height * 0.07,
                              decoration: customBoxBorder(),
                              child: Center(
                                child: DropdownButtonFormField<String>(
                                  borderRadius: BorderRadius.circular(20),
                                  decoration: InputDecoration(
                                      enabledBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide.none),
                                      focusedBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide.none),
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            showCategoryAddPopup(context);
                                          },
                                          icon: const Icon(
                                            Icons.add_circle,
                                            color: white,
                                          ))),
                                  dropdownColor: Colors.teal,
                                  value: _categoryId,
                                  items: (_selectedCategoryType ==
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
                                      _categoryId = selectedValue;
                                    });
                                  },
                                  hint: const Text(
                                    'Select Category',
                                    style: TextStyle(color: Colors.grey),
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
                                      textInputType: TextInputType.name,
                                      controller: _notesController,
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
                                      controller: _amountController,
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
                          sizeBox40(height),
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
                              addTransaction();
                            },
                            child: const Text('ADD +'),
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

  Future<void> addTransaction() async {
    final noteText = _notesController.text;
    final amountText = _amountController.text;

    if (noteText.isEmpty) {
      return;
    }
    if (amountText.isEmpty) {
      return;
    }
    if (_categoryId == null) {
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
        purpose: noteText,
        amount: parsedAmount,
        date: _selectedDate!,
        type: _selectedCategoryType!,
        category: _selectedCategoryModel!,
        id: DateTime.now().millisecondsSinceEpoch.toString());
    await TransactionDB.instance.addTransaction(model);
    
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
    filterFunction();
    await TransactionDB.instance.refresh();
    widget.hController.balanceAmount();
    
    
    // ignore: use_build_context_synchronously
    customSnakBar('Transaction added Successfully', 'Success');

    
  }
}
