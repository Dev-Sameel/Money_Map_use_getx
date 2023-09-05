import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../subScreens/refactoring/styles.dart';

showDetailsDialog(BuildContext context, value) {
  return SimpleDialog(
    backgroundColor: graphBlue,
    shape: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color:bgColor,width: 4),
    ),
    title: const Center(
      child: Text(
        'Transaction Details',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black,fontFamily: 'Inder',),
      ),
    ),
    children: [
      Container(
        height: 120,
        margin: const EdgeInsets.only(left: 20),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Category         :  ',
                  style: detTtl,
                ),
                Expanded(
                  child: Text(
                    capitalize('${value.category.name}'),
                    style: detSub,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Description      :  ',
                  style: detTtl,
                ),
                Expanded(child: Text(capitalize('${value.purpose}'), style: detSub)),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Amount          :  ',
                  style: detTtl,
                ),
                Expanded(child: Text(' ${value.amount}', style: detSub)),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Date               :  ',
                  style: detTtl,
                ),
                Expanded(child: Text(DateFormat.yMMMMd().format(value.date), style: detSub)),
              ],
            )
          ],
        ),
      ),
    ],
  );
}
