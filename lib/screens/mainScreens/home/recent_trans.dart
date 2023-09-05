import 'package:flutter/material.dart';
import '../../../data_base/transaction/transaction_db.dart';
import '../../../models/category/category_model.dart';
import '../../../models/transaction/transaction_model.dart';
import '../../subScreens/refactoring/list_tile_details.dart';

enum TransactionFilter {
  all,
  income,
  expense,
}

class RecentTransaction extends StatefulWidget {
  const RecentTransaction({super.key});
  @override
  State<RecentTransaction> createState() => _RecentTransactionState();
}

TransactionFilter _selectedFilter = TransactionFilter.all;

class _RecentTransactionState extends State<RecentTransaction> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Recent Transactions',
              style: TextStyle(
                fontFamily: 'Inder',
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
            DropdownButton<TransactionFilter>(
              dropdownColor: const Color.fromARGB(255, 255, 246, 206),
              borderRadius: BorderRadius.circular(20),
              underline: const SizedBox(),
              icon: const Icon(
                Icons.filter_list,
                color: Colors.white,
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
          ],
        ),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: TransactionDB.instance.transactionListNotifier,
            builder: (BuildContext context, List<TransactionModel> newList,
                Widget? _) {
              List<TransactionModel> filterlist = [];
              if (_selectedFilter == TransactionFilter.all) {
                filterlist = newList;
              } else if (_selectedFilter == TransactionFilter.income) {
                filterlist.addAll(newList
                    .where(
                        (transaction) => transaction.type == CategoryType.icome)
                    .toList());
              } else {
                filterlist.addAll(newList
                    .where((transaction) =>
                        transaction.type == CategoryType.expense)
                    .toList());
              }
              var fLength = filterlist.length <= 4 ? filterlist.length : 4;
              return listTileDetails(context, filterlist, fLength);
            },
          ),
        ),
      ],
    );
  }
}
