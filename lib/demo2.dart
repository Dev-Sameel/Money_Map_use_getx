// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:money_management_app/data_base/graph/chart.dart';
// import 'package:money_management_app/screens/subScreens/refactoring/styles.dart';
// import '../../../data_base/balance/balance_db.dart';
// import '../../../data_base/transaction/transaction_db.dart';

// Future<void> tranDelePop(BuildContext context, value) async {
//   return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           backgroundColor: graphBlue,
//           title: const Row(
//             children: [
//               Text('Delete',
//                   style: TextStyle(
//                       fontFamily: 'inder', fontWeight: FontWeight.w500)),
//             ],
//           ),
//           content: SizedBox(
//             height: 70,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Are you sure want to delete?',
//                   style: TextStyle(fontFamily: 'inder'),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     TextButton(
//                         onPressed: () {
//                           Get.back();
//                         },
//                         child: const Text(
//                           'Cancel',
//                           style: TextStyle(fontSize: 15),
//                         )),
//                     TextButton(
//                         onPressed: () {
//                           TransactionDB.instance.deleteTransaction(value.id!);
//                           Get.back();
//                           filterFunction();
//                           TransactionDB.instance.refresh();
//                           Amounts.instance.balanceAmount();
//                         },
//                         child: const Text('Ok', style: TextStyle(fontSize: 15)))
//                   ],
//                 )
//               ],
//             ),
//           ),
//         );
//       });
// }
