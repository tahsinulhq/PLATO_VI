// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SubmitButton extends StatefulWidget {
  //const ({ Key? key }) : super(key: key);
  SubmitButton({required this.onPressed});
  GestureTapCallback onPressed;

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // ElevatedButton(
          //    style: style,
          //    onPressed: null,
          //    child: const Text('Disabled'),
          // ),
          const SizedBox(height: 30),
          ElevatedButton(
              style: style, onPressed: () {}, child: const Text('Submit')),
        ],
      ),
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   final ButtonStyle style =
//       ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

//   return Center(
//     child: Column(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         // ElevatedButton(
//         //    style: style,
//         //    onPressed: null,
//         //    child: const Text('Disabled'),
//         // ),
//         const SizedBox(height: 30),
//         ElevatedButton(
//           style: style,
//           onPressed: () {},
//           child: const Text('Enabled'),
//         ),
//       ],
//     ),
//   );
// }
