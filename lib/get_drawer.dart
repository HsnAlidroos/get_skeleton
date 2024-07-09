
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetDrawer extends StatelessWidget {

  final Widget? child;

  const GetDrawer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    // final GetDrawerController drawerController = Get.put(GetDrawerController());
    return const Stack();
  }
}


class GetDrawerController extends GetxController {
  var isDrawerOpen = false.obs;

  void toggleDrawer() {
    isDrawerOpen.value = !isDrawerOpen.value;
  }

  void closeDrawer() {
    isDrawerOpen.value = false;
  }
}