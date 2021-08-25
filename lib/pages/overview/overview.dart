import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plato_six/controllers/menu_controller.dart';
import 'package:plato_six/helpers/responsiveness.dart';
import 'package:plato_six/widgets/custom_text.dart';
import 'package:plato_six/constant/controllers.dart';

class OverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children:[
        Obx(() => Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 
                ResponsiveWidget.isSmallScreen(context) ? 60 : 6
            ),
            child: CustomText(
              text: menuController.activeItem.value, 
              size: 24, 
              color: Colors.black, 
              weight: FontWeight.bold,
            ),
        )
      ],
      )),
      ],
    );
  }
}
