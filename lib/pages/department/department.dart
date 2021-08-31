import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:plato_six/helpers/responsiveness.dart';
import 'package:plato_six/pages/department/dwidgets/deptLayout.dart';
import 'package:plato_six/pages/department/dwidgets/dept_cards_largescreen.dart';
import 'package:plato_six/pages/department/dwidgets/dept_cards_smallscreen.dart';
import 'package:plato_six/pages/overview/owidgets/ploTable.dart';
import 'package:plato_six/widgets/custom_text.dart';
import 'package:plato_six/constant/controllers.dart';

class DepartmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Obx(() => Row(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                    child: CustomText(
                      text: menuController.activeItem.value,
                      size: 24,
                      color: Colors.black,
                      weight: FontWeight.bold,
                    ))
              ],
            )),

        Expanded(
            child: ListView(
          children: [
            if (ResponsiveWidget.isLargeScreen(context) ||
                ResponsiveWidget.isMediumScreen(context))
              if (ResponsiveWidget.isCustomSize(context))
                DeptCardsLargeScreen()
              else
                DeptCardsLargeScreen()
            else
              DeptCardsSmallScreen(),
            if (!ResponsiveWidget.isSmallScreen(context))
              DeptSectionLarge()
            else
              DeptSectionLarge(),
            Container(child: ploTableView()),
          ],
        ))

        // Expanded(child: child)
      ],
    );
  }
}
