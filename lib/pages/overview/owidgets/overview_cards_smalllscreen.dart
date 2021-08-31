
import 'package:flutter/material.dart';
import 'infocards_small.dart';


class OverviewCardsSmallScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 400,
        child: Column(
          children: [
            InfoCardSmall(
              title: "Total Students",
              value: "7",
              onT: () {},
              //isActive: true,
            ),
            SizedBox(
              height: _width / 64,
            ),
            InfoCardSmall(
              title: "Total PLO",
              value: "17",
              onT: () {},
            ),
            SizedBox(
              height: _width / 64,
            ),
            InfoCardSmall(
              title: "Total CO",
              value: "3",
              onT: () {},
            ),
            SizedBox(
              height: _width / 64,
            ),
            InfoCardSmall(
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