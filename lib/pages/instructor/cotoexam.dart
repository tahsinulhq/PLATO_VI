import 'package:flutter/material.dart';
import 'package:plato_six/widgets/custom_text.dart';

class cotoexamPage extends StatefulWidget {
  @override
  State<cotoexamPage> createState() => _cotoexamPageState();
}

class _cotoexamPageState extends State<cotoexamPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      CustomText(
        text: "CO to Exam Mapping:",
        size: 18,
        weight: FontWeight.bold,
        color: Colors.black87,
      ),
    ]);
  }
}
