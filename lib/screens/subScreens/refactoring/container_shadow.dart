import 'package:flutter/material.dart';
import '../../subScreens/refactoring/styles.dart';

containerShadow(brdRadius) {
  return BoxDecoration(
      boxShadow: contShadow(), color: bgColor, borderRadius: brdRadius);
}

contShadow() {
  return [
    const BoxShadow(
      color: contBottom,
      blurRadius: 15,
      spreadRadius: 1,
      offset: Offset(5, 5),
    ),
    const BoxShadow(
      color: Color.fromARGB(221, 0, 18, 31),
      blurRadius: 15,
      spreadRadius: 1,
      offset: Offset(-5, -5),
    ),
  ];
}

addDataBox() {
  return const BoxDecoration(
    borderRadius: BorderRadius.only(
        topRight: Radius.circular(50), bottomRight: Radius.circular(50)),
    boxShadow: [
      BoxShadow(
        color: Color.fromARGB(255, 207, 207, 207),
        blurRadius: 15,
        spreadRadius: 1,
        offset: Offset(5, 5),
      ),
      BoxShadow(
        color: Color.fromARGB(167, 255, 255, 255),
        blurRadius: 15,
        spreadRadius: 1,
        offset: Offset(-5, -5),
      ),
    ],
    color: Colors.white,
  );
}

customBoxBorder() {
  return BoxDecoration(
    borderRadius: const BorderRadius.only(
        topRight: Radius.circular(50), bottomRight: Radius.circular(50)),
    border: Border.all(color: const Color.fromRGBO(137, 135, 153, 1), width: 1),
  );
}
