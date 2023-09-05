import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:money_management_app/screens/subScreens/refactoring/others.dart';
import '../../subScreens/refactoring/styles.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: bgColor,
          title: const Text('Privacy Policy',
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
                'Our money manager app values your privacy and is committed to protecting your personal information. We only collect information that is necessary to provide you with the best possible service. We do not sell or share your information with third parties. Your data is secured using industry-standard measures. If you have any questions or concerns about your privacy, please contact us.\n\nWe collect information that you provide to us when you use the App, such as your name, email address, and financial account information. We may also collect information about your transactions, spending habits, and budgeting goals.\n\nWe use the information we collect to provide you with the services and features of the App, such as helping you track your expenses and manage your budget. We may also use your information to communicate with you about the App and to send you promotional offers and updates.',
                style: TextStyle(fontFamily: 'Raleway'),
                textAlign: TextAlign.justify,
              )),
            ],
          ),
        ));
  }
}
