import 'package:flutter/material.dart';
import 'student_info_cards.dart';

class StdCardsLargeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        StdInfoCards(
          title: "Total PLO",
          value: "12",
          topColor: Colors.lightGreen,
          onT: () {},
        ),
        SizedBox(
          width: _width / 64,
        ),
        StdInfoCards(
          title: "Total CO",
          value: "4",
          topColor: Colors.redAccent,
          onT: () {},
        ),
        SizedBox(
          width: _width / 64,
        ),
        StdInfoCards(
          title: "Total Assessments",
          value: "15",
          onT: () {},
          topColor: Colors.blueAccent,
        ),
      ],
    );
  }
}
