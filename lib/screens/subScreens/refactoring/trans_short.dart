import 'package:flutter/material.dart';
import 'package:money_management_app/screens/subScreens/refactoring/list_tile_details.dart';

import 'date_picker.dart';
import '../../../data_base/transaction/transaction_db.dart';
import '../../../models/category/category_model.dart';
import '../../../models/transaction/transaction_model.dart';

enum TransactionFilter {
  all,
  income,
  expense,
}

enum TimeFilter {
  today,
  thisWeek,
  thisMonth,
  all,
  custom,
}

class TransShort extends StatefulWidget {
  const TransShort({super.key});
  @override
  State<TransShort> createState() => _TransShortState();
}

class _TransShortState extends State<TransShort> {
  TransactionFilter _selectedFilter = TransactionFilter.all;
  TimeFilter _selectedTimeFilter = TimeFilter.all;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            DropdownButton<TransactionFilter>(
              dropdownColor: const Color.fromARGB(255, 255, 246, 206),
              borderRadius: BorderRadius.circular(20),
              underline: const SizedBox(),
              icon: const Icon(
                Icons.filter_list,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              onChanged: (value) {
                setState(() {
                  _selectedFilter = value!;
                });
              },
              items: const [
                DropdownMenuItem(
                  value: TransactionFilter.all,
                  child: Text('All'),
                ),
                DropdownMenuItem(
                  value: TransactionFilter.income,
                  child: Text('Income'),
                ),
                DropdownMenuItem(
                  value: TransactionFilter.expense,
                  child: Text('Expense'),
                ),
              ],
            ),
            DropdownButton<TimeFilter>(
              dropdownColor: const Color.fromARGB(255, 255, 246, 206),
              icon: const Icon(
                Icons.filter_list,
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(20),
              underline: const SizedBox(),
              onChanged: (value) {
                setState(() {
                  _selectedTimeFilter = value!;
                });
              },
              items: const [
                DropdownMenuItem(
                  value: TimeFilter.all,
                  child: Text('All'),
                ),
                DropdownMenuItem(
                  value: TimeFilter.today,
                  child: Text('Today'),
                ),
                DropdownMenuItem(
                  value: TimeFilter.thisWeek,
                  child: Text('Week'),
                ),
                DropdownMenuItem(
                  value: TimeFilter.thisMonth,
                  child: Text('Month'),
                ),
                DropdownMenuItem(
                  value: TimeFilter.custom,
                  child: WidgetDateRangePicker(),
                ),
              ],
            ),
          ],
        ),
      ),
      Expanded(
        child: ValueListenableBuilder<List<TransactionModel>>(
          valueListenable: TransactionDB.instance.transactionListNotifier,
          builder: (BuildContext context, List<TransactionModel> newlist, _) {
            List<TransactionModel> filterlist = [];

            if (_selectedFilter == TransactionFilter.all) {
              filterlist = newlist;
            } else if (_selectedFilter == TransactionFilter.income) {
              filterlist.addAll(newlist
                  .where(
                      (transaction) => transaction.type == CategoryType.icome)
                  .toList());
            } else {
              filterlist.addAll(newlist
                  .where(
                      (transaction) => transaction.type == CategoryType.expense)
                  .toList());
            }

            if (_selectedTimeFilter == TimeFilter.today) {
              final now = DateTime.now();
              final today = DateTime(now.year, now.month, now.day);
              filterlist = filterlist
                  .where((transaction) =>
                      transaction.date.year == today.year &&
                      transaction.date.month == today.month &&
                      transaction.date.day == today.day)
                  .toList();
            } else if (_selectedTimeFilter == TimeFilter.thisWeek) {
              final now = DateTime.now();
              final today = DateTime(now.year, now.month, now.day);
              final startOfWeek =
                  today.subtract(Duration(days: today.weekday - 1));
              final endOfWeek = today.add(Duration(days: 7 - today.weekday));
              filterlist = filterlist
                  .where((transaction) =>
                      transaction.date.isAfter(startOfWeek) &&
                      transaction.date.isBefore(endOfWeek))
                  .toList();
            } else if (_selectedTimeFilter == TimeFilter.thisMonth) {
              final now = DateTime.now();
              final startOfMonth = DateTime(now.year, now.month, 0);
              final endOfMonth = DateTime(now.year, now.month + 1, 0);
              filterlist = filterlist
                  .where((transaction) =>
                      transaction.date.isAfter(startOfMonth) &&
                      transaction.date.isBefore(endOfMonth))
                  .toList();
            } else if (_selectedTimeFilter == TimeFilter.custom) {
              filterlist = filterlist
                  .where((element) =>
                      element.date
                          .isAfter(first!.subtract(const Duration(days: 1))) &&
                      element.date
                          .isBefore(second!.add(const Duration(days: 1))))
                  .toList();
            }
            var fLength = filterlist.length;

            return listTileDetails(context, filterlist, fLength);
          },
        ),
      ),
    ]);
  }
}
