
import 'package:flutter/material.dart';
import 'package:plato_six/widgets/custom_text.dart';

class OverviewPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: CustomText(text: "Overview",size: 18, weight: FontWeight.bold, color: Colors.black87,)
    );
  }
}