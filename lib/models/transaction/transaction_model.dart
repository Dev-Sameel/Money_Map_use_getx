import 'package:hive_flutter/hive_flutter.dart';
import '../category/category_model.dart';
part 'transaction_model.g.dart';

@HiveType(typeId: 3)
class TransactionModel
{
  @HiveField(0)
  late final String purpose;

  @HiveField(1)
  late final double amount;

  @HiveField(2)
  late final DateTime date;

  @HiveField(3)
  final CategoryType type;

  @HiveField(4)
  late final CategoryModel category;
   
  @HiveField(5) 
   String? id;

  TransactionModel(
    {
      required this.purpose,
      required this.amount,
      required this.date,
      required this.type,
      required this.category,
      required this.id,
    }
  );
  
}