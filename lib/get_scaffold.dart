import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './get_skeleton.dart';

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
    final GetScaffoldController getScaffoldController = Get.put(GetScaffoldController());
    if(drawer != null)
    {
      getScaffoldController.hasDrawer.value = true;
    }
    return Material(
      child: Stack(
        children: [
          // if (drawer != null) drawer!,
          
          Column(
            children: [
              if (appBar != null) appBar!,
              //
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: resizeToAvoidBottomInset ? MediaQuery.of(context).viewInsets.bottom : 0,
                  ),
                  child: SafeArea(
                    child: body ?? Container(),
                  ),
                ),
              ),
              //
              if (bottomNavigationBar != null) bottomNavigationBar!,
            ],
          ),
          if (floatingActionButton != null)
            Positioned(
              bottom: 16,
              right: 16,
              child: floatingActionButton!,
            ),

            Obx(
              // () => getScaffoldController.showDrawer(drawer!),
              () => getScaffoldController.isDrawerOpen.isTrue ? Container(
                  color: Colors.black, 
                  width: Get.mediaQuery.size.width - 100,
                  height: Get.mediaQuery.size.height,
                ) : const SizedBox(),
            ),
        ],
      ),
    );
  }
}



