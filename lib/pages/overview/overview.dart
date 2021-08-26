import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plato_six/controllers/menu_controller.dart';
import 'package:plato_six/helpers/responsiveness.dart';
import 'package:plato_six/widgets/custom_text.dart';
import 'package:plato_six/pages/overview/owidgets/info_cards.dart';
import 'package:plato_six/pages/overview/owidgets/overview_cards_largescreen.dart';
import 'package:plato_six/constant/controllers.dart';

class OverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: CustomText(text: "OverView",size: 18, weight: FontWeight.bold, color: Colors.black87,)
    );
  }
}