import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import '../../../controller/bottombar_controler.dart';
import '../../mainScreens/category/add_category_screen.dart';
import '../../mainScreens/home/home_screen.dart';
import '../../mainScreens/statitics/graphs.dart';
import '../../mainScreens/transaction/transaction_screen.dart';
import '../refactoring/styles.dart';

class BottomItemBar extends StatelessWidget {
  final BottomItemBarController _controller =
      Get.put(BottomItemBarController());

  BottomItemBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller.controller,
        children: [
          HomeScreen(),
          TransactionScreen(),
          
           
          const Statistics(),
          const AddCategory(),
        ],
      ),
      bottomNavigationBar: Obx(
        () => WaterDropNavBar(
          backgroundColor: barColor,
          waterDropColor: white,
          bottomPadding: 5,
          onItemSelected: _controller.onItemSelected,
          selectedIndex: _controller.selectedIndex.value,
          barItems: [
            BarItem(
              filledIcon: Icons.home,
              outlinedIcon: Icons.home_outlined,
            ),
            BarItem(
                filledIcon: Icons.thumbs_up_down,
                outlinedIcon: Icons.thumbs_up_down_outlined),
            BarItem(
                filledIcon: Icons.leaderboard,
                outlinedIcon: Icons.leaderboard_outlined),
            BarItem(
                filledIcon: Icons.category,
                outlinedIcon: Icons.category_outlined),
          ],
        ),
      ),
    );
  }
}
