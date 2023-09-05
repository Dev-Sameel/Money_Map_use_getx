import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_management_app/screens/subScreens/refactoring/styles.dart';

dataEmpty(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Data is Empty',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(143, 199, 199, 199)),
        ),
        SizedBox(
          height: 10,
        ),
        Icon(
          Icons.warning,
          size: 35,
          color: Color.fromARGB(155, 219, 181, 179),
        ),
      ],
    ),
  );
}

void customSnakBar(String message, String title) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    colorText: white,
    margin: const EdgeInsets.all(20)
  );
}



class RemoveGlow extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, details) {
    return child;
  }
}
