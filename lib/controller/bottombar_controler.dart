import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomItemBarController extends GetxController {
  var selectedIndex = 0.obs;
  late PageController controller;

  @override
  void onInit() {
    controller = PageController(initialPage: selectedIndex.value);
    super.onInit();
  }

  void onItemSelected(int index) {
    selectedIndex.value = index;
    controller.animateToPage(
      selectedIndex.value,
      duration: const Duration(milliseconds: 1),
      curve: Curves.easeOutQuad,
    );
  }
}
