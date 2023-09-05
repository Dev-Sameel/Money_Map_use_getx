import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_management_app/screens/subScreens/refactoring/home_clipper.dart';
import 'package:money_management_app/screens/subScreens/refactoring/others.dart';
import 'package:money_management_app/screens/subScreens/refactoring/styles.dart';
import 'package:money_management_app/screens/subScreens/welcomePage/bottom_nav.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lottie/lottie.dart';

class UserScreen extends StatelessWidget {
   UserScreen({super.key});

  final _controlUsername = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Lottie.asset('assets/animations/welcome-animation.json',
            height: 300),
        toolbarHeight: 300,
        elevation: 0,
        flexibleSpace: ClipPath(
          clipper: MyCustomClipper3(),
          child: Container(
            width: width,
            color: Colors.white,
          ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: RemoveGlow(),
        child: ListView(
          children: [
            SizedBox(
              height: height / 10,
            ),
            Column(
              children: [
                const Text(
                  'Smart Way\nTo Manage Finance.',
                  style: TextStyle(
                      color: white, fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80, right: 80),
                  child: SizedBox(
                    height: 40,
                    width: width * 60 / 100,
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: _controlUsername,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(100)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: white),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        hintText: 'Please Enter Your Name',
                        hintStyle: const TextStyle(fontSize: 14, color: white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 24),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 200.0,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      checkUserName();
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    child: const Text('Get Started'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void checkUserName() async {
    if (_controlUsername.text == '') {
      customSnakBar('Name is Required', 'Alert');
    } else {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString('nameKey', _controlUsername.text);

      // ignore: use_build_context_synchronously
      Get.offAll(()=>BottomItemBar());
    }
  }
}
