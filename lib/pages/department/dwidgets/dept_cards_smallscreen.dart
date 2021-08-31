import 'package:flutter/material.dart';
import 'dept_infocards_small.dart';

class DeptCardsSmallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 400,
        child: Column(
          children: [
            DeptInfoCardSmall(
              title: "Total Students",
              value: "7",
              onT: () {},
              //isActive: true,
            ),
            SizedBox(
              height: _width / 64,
            ),
            DeptInfoCardSmall(
              title: "Total PLO",
              value: "17",
              onT: () {},
            ),
            SizedBox(
              height: _width / 64,
            ),
            DeptInfoCardSmall(
              title: "Total CO",
              value: "3",
              onT: () {},
            ),
            SizedBox(
              height: _width / 64,
            ),
            DeptInfoCardSmall(
              title: "Total Assessments",
              value: "32",
              onT: () {},
            ),
          ],
        ),
      ),
    );
  }
}
