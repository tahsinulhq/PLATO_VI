import 'package:flutter/material.dart';
import 'dept_info_cards.dart';

class DeptCardsLargeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        DeptInfoCards(
          title: "Total Students",
          value: "100",
          onT: () {},
          topColor: Colors.orange,
        ),
        SizedBox(
          width: _width / 64,
        ),
        DeptInfoCards(
          title: "Total PLO",
          value: "12",
          topColor: Colors.lightGreen,
          onT: () {},
        ),
        SizedBox(
          width: _width / 64,
        ),
        DeptInfoCards(
          title: "Total CO",
          value: "4",
          topColor: Colors.redAccent,
          onT: () {},
        ),
        SizedBox(
          width: _width / 64,
        ),
        DeptInfoCards(
          title: "Total Assessments",
          value: "15",
          onT: () {},
          topColor: Colors.blueAccent,
        ),
      ],
    );
  }
}
