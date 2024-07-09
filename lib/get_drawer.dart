import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './get_scaffold_controller.dart';

class GetDrawer extends StatelessWidget {
  final Widget? child;

  const GetDrawer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    final GetScaffoldController controller = Get.put(GetScaffoldController());
    
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx < 0 && !controller.isDrawerOpen.value) {
          // Swiping right to open the drawer
          controller.openDrawer();
        } else if (details.delta.dx > 0 && controller.isDrawerOpen.value) {
          // Swiping left to close the drawer
          controller.closeDrawer();
        }
      },
      child: Obx(
        () => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: Matrix4.translationValues(
            controller.isDrawerOpen.value
                ? controller.drawerEndPosition.value
                : controller.drawerStartPosition.value,
            0,
            0,
          ),
          curve: Curves.easeInOut,
          child: Container(
            width: controller.drawerWidth.value,
            color: Colors.white,
            child: GestureDetector(
              onTap: () {}, // Prevent closing the drawer when tapped inside
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
