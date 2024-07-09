import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './get_scaffold_controller.dart';
import './get_drawer.dart';

class GetScaffold extends StatelessWidget {
  final Widget? body;
  final Widget? floatingActionButton;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final bool resizeToAvoidBottomInset;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;

  const GetScaffold({
    super.key,
    this.body,
    this.floatingActionButton,
    this.appBar,
    this.drawer,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.resizeToAvoidBottomInset = true,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
  });

  @override
  Widget build(BuildContext context) {
    final GetScaffoldController controller = Get.put(GetScaffoldController());
    if (drawer != null) {
      controller.hasDrawer.value = true;
    }
    
    return Material(
      child: GestureDetector(
        onTap: () {
          if (controller.isDrawerOpen.value) {
            controller.closeDrawer();
          }
        },
        child: Stack(
          children: [
            Column(
              children: [
                if (appBar != null) appBar!,
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: resizeToAvoidBottomInset ? Get.mediaQuery.viewInsets.bottom : 0,
                    ),
                    child: SafeArea(
                      child: body ?? Container(),
                    ),
                  ),
                ),
                if (bottomNavigationBar != null) bottomNavigationBar!,
              ],
            ),
            if (floatingActionButton != null)
              Positioned(
                bottom: 16,
                right: 16,
                child: floatingActionButton!,
              ),
            if (controller.hasDrawer.value)
              Obx(
                () => controller.isDrawerOpen.value
                    ? GetDrawer(child: drawer)
                    : const SizedBox(),
              ),
          ],
        ),
      ),
    );
  }
}
