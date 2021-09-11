import 'package:flutter/material.dart';
import 'package:plato_six/pages/student/swidgets/student_info_cards_small.dart';

class StdCardsSmallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 400,
        child: Column(
          children: [
            StdInfoCardSmall(
              title: "Total PLO",
              value: "12",
              onT: () {},
            ),
            SizedBox(
              width: _width / 64,
            ),
            StdInfoCardSmall(
              title: "Total CO",
              value: "4",
              onT: () {},
            ),
            SizedBox(
              width: _width / 64,
            ),
            StdInfoCardSmall(
              title: "Total Assessments",
              value: "15",
              onT: () {},
            ),
          ],
        ),
      ),
    );
  }
}
