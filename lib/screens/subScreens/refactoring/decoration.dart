import 'package:flutter/material.dart';
import 'package:money_management_app/screens/subScreens/refactoring/styles.dart';

// ignore: must_be_immutable
class InputDecor extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? textInputType;
  const InputDecor({
    super.key,
    required this.controller,
    required this.hintText,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: white),
      keyboardType: textInputType,
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey)),
    );
  }
}

sizeBox25(height) {
  return SizedBox(
    height: height * 25 / 812,
  );
}

sizeBox15(height) {
  return SizedBox(
    height: height * 15 / 812,
  );
}

sizeBox7(height) {
  return SizedBox(
    height: height * 7 / 812,
  );
}

sizeBox40(height) {
  return SizedBox(
    height: height * 40 / 812,
  );
}


