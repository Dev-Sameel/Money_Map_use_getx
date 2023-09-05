import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


String capitalize(String text) {
  return text[0].toUpperCase() + text.substring(1);
}

String parseDate(DateTime date) {
  final formatter = DateFormat('dd MMM yyyy');
  return formatter.format(date);
}

const red=Colors.red;
const incomeColor = Color.fromARGB(255, 181, 243, 175);
const expenseColor = Color.fromARGB(255, 243, 175, 175);
const bgColor = Color.fromARGB(255, 34, 54, 70);
const white = Colors.white;
const textSTYL = TextStyle(color: Colors.white);
const barColor = Color.fromARGB(255, 86, 110, 128);
const contBottom = Color.fromARGB(185, 123, 150, 170);
const cardColor = Color.fromARGB(255, 255, 246, 206);
const detTtl=TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.black,fontFamily: 'Inder',);
const detSub= TextStyle(fontSize: 16,color: Colors.black,fontFamily: 'Inder',);
const textSTYL2=TextStyle(fontWeight: FontWeight.w500, color: Color.fromARGB(255, 117, 117, 117));
const graphBlue = Color.fromARGB(255, 224, 241, 255);
const snakbarGradient =LinearGradient(colors: [Color.fromRGBO(212, 247, 145, 1), Color.fromRGBO(9, 191, 215, 1)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        );

const buttonGradient =   LinearGradient(
          colors: [
           Color.fromRGBO(187, 63, 221, 1),
           Color.fromRGBO(251, 109, 169, 1),
           Color.fromRGBO(255, 159, 124, 1),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        );








