import 'package:get/get.dart';

class GetScaffoldController extends GetxController {
  var hasDrawer = false.obs;
  var isDrawerOpen = false.obs;

  var drawerWidth = 250.0.obs; // Width of the drawer
  var drawerStartPosition = (-250.0).obs; // Initial position of the drawer (hidden)
  var drawerEndPosition = 0.0.obs; // Final position of the drawer (visible)

  void toggleDrawer() {
    isDrawerOpen.value = !isDrawerOpen.value;
    if (isDrawerOpen.value) {
      openDrawer();
    } else {
      closeDrawer();
    }
  }

  void openDrawer() {
    isDrawerOpen.value = true;
  }

  void closeDrawer() {
    isDrawerOpen.value = false;
  }
}
