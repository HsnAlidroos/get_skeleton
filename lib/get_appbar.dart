import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'get_scaffold_controller.dart';

class GetAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double? height;
  final Color? backgroundColor;
  final Color? color;
  final IconButton? leadIcon;

  const GetAppBar(this.title,{
    super.key,
    this.height,
    this.backgroundColor,
    this.color,
    this.leadIcon,
  });

  @override
  Widget build(BuildContext context) {
    final GetScaffoldController getScaffoldController = Get.put(GetScaffoldController());
    double xheight = height ?? Get.mediaQuery.size.height / 8;

    return Container(
      color: backgroundColor ?? Colors.blue,
      height: xheight,
      child: Column(
        children: [
          Container(
            height: Get.mediaQuery.padding.top,
          ),
          SizedBox(
            height: xheight - Get.mediaQuery.padding.top,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                if (getScaffoldController.hasDrawer.isTrue)
                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () {
                      getScaffoldController.toggleDrawer();
                    },
                  ),
                if (leadIcon != null) leadIcon!,
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(color: color ?? Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
