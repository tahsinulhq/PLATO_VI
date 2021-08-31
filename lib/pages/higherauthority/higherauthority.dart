import 'package:flutter/material.dart';
import 'package:plato_six/widgets/custom_text.dart';

class HigherAuthorityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: CustomText(
      text: "Higher Authority",
      size: 18,
      weight: FontWeight.bold,
      color: Colors.black87,
    ));
  }
}
