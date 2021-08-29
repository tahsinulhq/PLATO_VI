import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:plato_six/helpers/responsiveness.dart';
import 'package:plato_six/widgets/custom_text.dart';
import 'package:plato_six/constant/controllers.dart';

class StudentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: CustomText(
      text: "Student",
      size: 18,
      weight: FontWeight.bold,
      color: Colors.black87,
    ));
  }
}
