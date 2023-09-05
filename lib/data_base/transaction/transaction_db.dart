import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../models/transaction/transaction_model.dart';

const transactionDbName = 'transaction-db';

abstract class TransactionDbFunction {
  Future<void> addTransaction(TransactionModel obj);
  Future<List<TransactionModel>> getAllTransaction();
  Future<void> deleteTransaction(String id);
  Future<void> updateTransaction(int id, TransactionModel obj);
}

class TransactionDB implements TransactionDbFunction {
  TransactionDB._internal();
  static TransactionDB instance = TransactionDB._internal();

  factory TransactionDB() {
    return instance;
  }

  ValueNotifier<List<TransactionModel>> transactionListNotifier =
      ValueNotifier([]);
  ValueNotifier<List<TransactionModel>> transactionfilternotifier =
      ValueNotifier([]);

  @override
  Future<void> addTransaction(TransactionModel obj) async {
    final db = await Hive.openBox<TransactionModel>(transactionDbName);
    await db.put(obj.id, obj);
  }

  Future<void> refresh() async {
    final list = await getAllTransaction();
    list.sort((first, second) => second.date.compareTo(first.date));
    transactionListNotifier.value.clear();
    transactionfilternotifier.value.clear();
    transactionListNotifier.value.addAll(list);
    transactionfilternotifier.value.clear();
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    transactionListNotifier.notifyListeners();
  }

  @override
  Future<List<TransactionModel>> getAllTransaction() async {
    final db = await Hive.openBox<TransactionModel>(transactionDbName);
    return db.values.toList();
  }

  Future<void> clearAllData() async {
    final db = await Hive.openBox<TransactionModel>(transactionDbName);
    await db.clear();
    await refresh(); 
  }

  @override
  Future<void> deleteTransaction(String id) async {
    final transactionDB =
        await Hive.openBox<TransactionModel>(transactionDbName);
    await transactionDB.delete(id);
  }

  Future<void> editTransaction(TransactionModel model) async {
    final db = await Hive.openBox<TransactionModel>(transactionDbName);
    await db.delete(model.id);
    await db.put(model.id, model);
    refresh();
    
  }

  @override
  Future<void> updateTransaction(int id, TransactionModel obj) async {
    final transactiondb =
        await Hive.openBox<TransactionModel>(transactionDbName);
    transactiondb.putAt(id, obj);
    
    refresh();
  }

  Future<void> searchHistory(String text) async {
    final transactiondb =
        await Hive.openBox<TransactionModel>(transactionDbName);
    transactionListNotifier.value.clear();
    transactionListNotifier.value.addAll(transactiondb.values
        .where((element) => element.category.name.contains(text)));
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    transactionListNotifier.notifyListeners();
  }
}



