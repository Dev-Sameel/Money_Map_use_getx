import 'package:flutter/material.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:flutter_flip_card/flipcard/flip_card.dart';
import 'package:flutter_flip_card/modal/flip_side.dart';
import 'package:lottie/lottie.dart';
import 'package:money_management_app/screens/subScreens/refactoring/container_shadow.dart';
import 'package:money_management_app/screens/subScreens/refactoring/others.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../subScreens/refactoring/styles.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final con = FlipCardController();

    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: bgColor,
          title: const Text(
            'About Us',
            style: TextStyle(fontFamily: 'Inder'),
          ),
          centerTitle: true,
        ),
        body: ScrollConfiguration(
          behavior: RemoveGlow(),
          child: ListView(
            children: [
              FlipCard(
                rotateSide: RotateSide.right,
                onTapFlipping: false,
                axis: FlipAxis.vertical,
                controller: con,
                frontWidget: Center(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin:  EdgeInsets.only(right: 20,left: 20,top: MediaQuery.of(context).size.height/4,bottom: 20),
                    decoration: BoxDecoration(
                        boxShadow: contShadow(),
                        color: bgColor,
                        borderRadius: BorderRadius.circular(20)),
                    height: 260,
                    width: MediaQuery.of(context).size.width / 1.4,
                    child: Column(
                      children: [
                        const Text(
                          'Money Map',
                          style: TextStyle(
                              fontFamily: 'Inder',
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 219, 219, 219),
                              fontSize: 20),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Money Map is offline money management application.You can manage your daily income and expense easily.',
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              height: 1.2,
                              fontSize: 15,
                              color: Color.fromARGB(255, 219, 219, 219)),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                              text: 'Developed By',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 143, 143, 143),
                                  fontFamily: 'Raleway')),
                          TextSpan(
                              text: ' SAMEEL',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 143, 143, 143),
                                  fontFamily: 'Raleway'))
                        ])),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: TextButton(
                            style: const ButtonStyle(
                                overlayColor:
                                    MaterialStatePropertyAll(Colors.transparent)),
                            onPressed: () {
                              con.flipcard();
                            },
                            child: const Text(
                              'Tap to contact',
                              style: TextStyle(fontFamily: 'Inder', color: graphBlue),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                backWidget: Center(
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        margin:  EdgeInsets.only(right: 20,left: 20,top: MediaQuery.of(context).size.height/4,bottom: 20),
                        decoration: BoxDecoration(
                            boxShadow: contShadow(),
                            color: bgColor,
                            borderRadius: BorderRadius.circular(20)),
                        height: 260,
                        width: MediaQuery.of(context).size.width / 1.4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    String url1 =
                                        'https://instagram.com/dev.sameel?utm_source=qr&igshid=NGExMmI2YTkyZg%3D%3D';
                                    if (url1.isNotEmpty) {
                                      // ignore: deprecated_member_use
                                      launch(url1);
                                    }
                                  },
                                  child: Lottie.asset(
                                      'assets/animations/instagram.json',
                                      width: 30),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    String url2 =
                                        'https://www.linkedin.com/in/sameel-pookkodan-4b55a4269';
                                    if (url2.isNotEmpty) {
                                      // ignore: deprecated_member_use
                                      launch(url2);
                                    }
                                  },
                                  child: Lottie.asset(
                                      'assets/animations/linkedin.json',
                                      width: 30),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    String url3 = 'mailto:pookkodansameel@gmail.com';
                                    if (url3.isNotEmpty) {
                                      // ignore: deprecated_member_use
                                      launch(url3);
                                    }
                                  },
                                  child: Lottie.asset('assets/animations/mail.json',
                                      width: 20),
                                )
                              ],
                            ),
                            const Text(
                              '► Thank You ◄',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 219, 219, 219),
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              style: const ButtonStyle(
                                  overlayColor:
                                      MaterialStatePropertyAll(Colors.transparent)),
                              onPressed: () {
                                con.flipcard();
                              },
                              child: const Text(
                                'Tap to Back',
                                style: TextStyle(color: graphBlue),
                              ),
                            ),
                          ],
                        ))),
              ),
            ],
          ),
        ));
  }
}
