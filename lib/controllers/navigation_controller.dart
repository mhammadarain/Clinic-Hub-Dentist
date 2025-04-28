import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class NavigationController extends GetxController {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  var selectedIndex = 0.obs;

  void scrollTo(int index) {
    selectedIndex.value = index;
    if (itemScrollController.isAttached) {
      itemScrollController.scrollTo(
        index: index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}
