import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:plato_six/constant/controllers.dart';
import 'package:plato_six/constant/style.dart';
import 'package:plato_six/controllers/navigation_controller.dart';
import 'package:plato_six/helpers/responsiveness.dart';
import 'package:plato_six/routing/routes.dart';
import 'package:plato_six/widgets/side_menu_item.dart';

import 'custom_text.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
      color: grey,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(width: _width / 48),
                    //Padding(
                    //padding: const EdgeInsets.only(right: 12),
                    //child: Image.asset("assets/icons/logo.png"),
                    //),
                    Flexible(child: Image.asset('logo.png')),
                    SizedBox(width: _width / 48),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          if (!ResponsiveWidget.isSmallScreen(context))
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Flexible(child: Image.asset('logo.png')),
            ),
          //Divider(color: lightGrey.withOpacity(.1), ),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItemRoutes
                .map((item) => SideMenuItem(
                    itemName: item.name,
                    onTap: () {
                      // if(item.route == AuthenticationPageRoute){
                      //   Get.offAllNamed(AuthenticationPageRoute);
                      //   menuController.changeActiveItemTo(overviewPageDisplayName);

                      // }
                      if (!menuController.isActive(item.name)) {
                        menuController.changeActiveItemTo(item.name);
                        if (ResponsiveWidget.isSmallScreen(context)) Get.back();
                        navigationController.navigateTo(item.route);
                      }
                    }))
                .toList(),
          ),
        ],
      ),
    );
  }
}
