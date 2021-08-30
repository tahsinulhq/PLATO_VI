import 'package:flutter/material.dart';
import 'package:plato_six/widgets/custom_text.dart';

class plotocoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      CustomText(
        text: "PLO to CO Mapping:",
        size: 18,
        weight: FontWeight.bold,
        color: Colors.black87,
      ),
    ]);
  }
}
