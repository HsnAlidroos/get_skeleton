

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'get_scaffold_controller.dart';

// ignore: must_be_immutable
class GetAppBar extends StatelessWidget implements PreferredSizeWidget{
  // const CustomAppBar({super.key});


  final String title;
  double? height;
  Color? backgroundColor;
  Color? color;
  IconButton? leadIcon;

  GetAppBar(
    this.title, {
    super.key,
    this.height,
    this.backgroundColor,
    this.color,
    this.leadIcon,
  });
  @override
  Widget build(BuildContext context) {
    // GetScaffoldController controller = GetScaffoldController();
    final GetScaffoldController getScaffoldController = Get.put(GetScaffoldController());
    
    // MediaQueryData mediaQuery = MediaQuery.of(context);
    // double height =
    //     (mediaQuery.size.height - mediaQuery.padding.top); // * kHeaderHeight;
    //     print(height);
    // double height = Get.mediaQuery.size.height/8.5;
    double xheight = height?? Get.mediaQuery.size.height/8;
    return Container(
      color: backgroundColor?? Colors.blue,
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
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if(getScaffoldController.hasDrawer.isTrue)
                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () {
                      getScaffoldController.toggleDrawer();
                      // if (drawerController.isDrawerOpen.value) {
                      //   drawerController.closeDrawer();
                      // } else {
                      //   // GetScaffold.openDrawer();
                      //   drawerController.toggleDrawer();
                      // }
                    },
                  ),


                // IconButton(
                //   color: Colors.black,
                //   icon: const Icon(Icons.chevron_left),
                //   onPressed: () => Navigator.pop(context),
                // ),
                if(leadIcon != null) leadIcon!,
                
                const SizedBox(width: 10),
                Text(
                  title, 
                  style: TextStyle(color: color?? Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight);
}