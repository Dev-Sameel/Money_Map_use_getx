import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:money_management_app/screens/subScreens/refactoring/others.dart';
import '../../subScreens/refactoring/styles.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: bgColor,
          title: const Text('Terms & Conditions',
              style: TextStyle(fontFamily: 'Inder')),
          centerTitle: true,
        ),
        body: ScrollConfiguration(
          behavior: RemoveGlow(),
          child: ListView(
            children: [
          SizedBox(
              height: 180,
              child: Lottie.asset('assets/animations/reading-book.json')),
          Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black)),
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              child: const Text(
                'Welcome to our money management application. These terms and conditions govern your use of our application. By using our application, you agree to these terms and conditions. If you do not agree to these terms and conditions, you may not use our application.\n\nTo use our application, you must create an account. You agree to provide accurate and complete information when creating your account. You are responsible for maintaining the security of your account and password. You agree to notify us immediately if you suspect any unauthorized use of your account.\n\nYou are solely responsible for any content that you upload or post on our application. You agree that you will not post any content that is unlawful, defamatory, harassing, or otherwise objectionable. We reserve the right to remove any content that violates these terms and conditions.\n\nOur application is intended for personal use only. You may not use our application for any commercial purpose or in a way that violates any laws or regulations.',
                style: TextStyle(fontFamily: 'Raleway'),
                textAlign: TextAlign.justify,
              )),
            ],
          ),
        ));
  }
}
