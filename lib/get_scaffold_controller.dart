

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetScaffoldController extends GetxController {
  var hasDrawer = false.obs;
  var isDrawerOpen = false.obs;

  void toggleDrawer() {
    isDrawerOpen.value = !isDrawerOpen.value;
    // print(isDrawerOpen);
  }

  void closeDrawer() {
    isDrawerOpen.value = false;
  }

  Widget showDrawer(Widget drawer) 
  {
    return drawer;
  }
}