import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data_base/balance/balance_db.dart';
import '../../subScreens/refactoring/styles.dart';
import 'package:money_management_app/screens/mainScreens/transaction/add_transaction_screen.dart';
import '../../subScreens/refactoring/container_shadow.dart';
import '../../subScreens/refactoring/home_cards.dart';
import 'recent_trans.dart';
import '../../subScreens/settings/settings.dart';

class HomeScreen extends StatelessWidget {
  final AmountsController hController = Get.put(AmountsController());
   HomeScreen({super.key}); 
 

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: barColor,
        title: Obx(
          ()=> Text(
            'Hi, ${hController.username}',
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'Inder',
                color: Colors.white),
          ),
        ),
      ),
      endDrawer:  Setting(),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: const EdgeInsets.only(top: 20),
            width: double.infinity,
            height:height*0.34 ,
            decoration: containerShadow(BorderRadius.circular(20)),
            child: Column(
              children: [
                const Text('Account Balance',
                    style: TextStyle(
                        fontFamily: 'Inder',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
                Obx(
                  ()=> Text(
                   hController.total.toString(),
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                            children: [
                              CustomCard(
                           
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                icon: Icons.archive,
                                iconColor:
                                    const Color.fromARGB(221, 0, 26, 44),
                                title: 'Income',
                               value: hController.income,
                              ),
                              CustomCard(
                             
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                icon: Icons.unarchive,
                                iconColor:
                                    const Color.fromARGB(221, 0, 26, 44),
                                title: 'Expense',
                                 value: hController.expense,
                              ),
                            ],
                          ),
                          Positioned(
                              left: width / 3,
                              top: 15,
                              child: SizedBox(
                                width: width / 4.5,
                                height: width / 4.5,
                                child: FloatingActionButton(
                                  onPressed: () {
                                  Get.to(()=>AddTransaction());
                                  },
                                  elevation: 15,
                                  backgroundColor: barColor,
                                  foregroundColor: white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: const Icon(
                                    Icons.add_circle,
                                    size: 55,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Expanded(child: RecentTransaction()),
        ],
      ),
    );
  }
}
