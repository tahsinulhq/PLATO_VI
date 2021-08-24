import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:plato_six/constant/controllers.dart';
import 'package:plato_six/constant/style.dart';
import 'package:plato_six/helpers/responsiveness.dart';
import 'package:plato_six/routing/routes.dart';
import 'package:plato_six/widgets/side_menu_item.dart';

import 'custom_text.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
      color: light,
      child: ListView(
        children: [
          if(ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(width: _width / 48),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image.asset("assets/icons/logo.png"),
                    ),
                    Flexible(
                      child: CustomText(
                        text: "Dash",
                        size: 20,
                        weight: FontWeight.bold,
                        color: active,
                      ),
                    ),
                    SizedBox(width: _width / 48),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          Divider(color: lightGrey.withOpacity(.1), ),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItems
                .map((itemName) => SideMenuItem(
                itemName: itemName == AuthenticationPageRoute ? "Log Out" : itemName,
                onTap: () {
                  if(itemName == AuthenticationPageRoute){
                    // TODO:: go to authentication page

                  }
                  if (!menuController.isActive(itemName)) {
                    menuController.changeActiveItemTo(itemName);
                    if(ResponsiveWidget.isSmallScreen(context))
                      Get.back();
                    // TODO :: go to item name Route
                    //navigationController.navigateTo(item.route);
                  }
                }, key: null,
            )).toList(),
          )
        ],
      ),
    );
  }
}