import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:plato_six/constant/controllers.dart';
import 'package:plato_six/constant/style.dart';
import 'package:plato_six/helpers/responsiveness.dart';
import 'package:plato_six/widgets/custom_text.dart';
import 'package:plato_six/widgets/large_screen.dart';
import 'package:plato_six/widgets/small_screen.dart';
class testpage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Obx(() => Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: ResponsiveWidget.isSmallScreen(context) ?  56:6,
              ),
              child: CustomText(
                text: menuController.activeItem.value, 
                size: 24, 
                color: Colors.orange,
                weight: FontWeight.bold),
            ),
          ],
        ))
      ],


    );
  }
}
