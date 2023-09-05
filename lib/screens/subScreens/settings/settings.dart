import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_management_app/screens/subScreens/settings/reset.dart';
import '../../subScreens/refactoring/styles.dart';
import 'package:share_plus/share_plus.dart';
import 'about.dart';
import 'privacy.dart';

import 'terms.dart';

class Setting extends StatelessWidget {
  final ResetMMController controller = Get.put(ResetMMController());
  Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: cardColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 200,
              color: bgColor,
              child: const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Image(image: AssetImage('assets/images/Logo.png')),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                Get.to(() => const AboutScreen());
              },
            ),
            const Divider(
              height: 2.0,
            ),
            ListTile(
              leading: const Icon(Icons.restart_alt),
              title: const Text('Reset'),
              onTap: () {
                Get.defaultDialog(
                  title: 'Reset',
                  middleText: 'Are you sure want to reset entire data?',
                  middleTextStyle:
                      TextStyle(color: Colors.grey[600]),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text(
                              'Cancel',
                              style: TextStyle(fontSize: 17),
                            )),
                        TextButton(
                            onPressed: () {
                              controller.resetMM();
                            },
                            child: const Text('Confirm',
                                style: TextStyle(fontSize: 17))),
                      ],
                    )
                  ],
                  contentPadding: const EdgeInsets.only(left: 40, right: 40),
                  
                );
              },
            ),
            const Divider(
              height: 2.0,
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Share'),
              onTap: () {
                Share.share(
                    "https://play.google.com/store/apps/details?id=in.brototype.money_map");
              },
            ),
            const Divider(
              height: 2.0,
            ),
            ListTile(
              leading: const Icon(Icons.text_snippet),
              title: const Text('Terms & Conditions'),
              onTap: () {
                Get.to(()=>const TermsScreen());
              },
            ),
            const Divider(
              height: 2.0,
            ),
            ListTile(
              leading: const Icon(Icons.security),
              title: const Text('Privacy Policy'),
              onTap: () {
               Get.to(()=>const PrivacyScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
