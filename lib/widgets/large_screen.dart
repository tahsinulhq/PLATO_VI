import 'package:flutter/material.dart';
import 'package:plato_six/constant/style.dart';

class LargeScreen extends StatelessWidget {
  // const LargeScreen({Key key}) : super (key: key);
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(child: Container(color: grey,)),
      Expanded(
          flex: 5,
          child: Container(color: Colors.black12,)),

    ],
    );
  }
}