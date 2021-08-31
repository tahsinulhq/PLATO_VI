import 'package:flutter/material.dart';
import 'haInfo_cards_small.dart';

class haOverviewCardsSmall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 400,
        child: Column(
          children: [
            haInfoCardsSmall(
              title: "Total Students",
              value: "30000",
              onT: () {},
              //isActive: true,
            ),
            SizedBox(
              height: _width / 64,
            ),
            haInfoCardsSmall(
              title: "Total Departments",
              value: "13",
              onT: () {},
            ),
            SizedBox(
              height: _width / 64,
            ),
            haInfoCardsSmall(
              title: "Total Programs",
              value: "35",
              onT: () {},
            ),
            SizedBox(
              height: _width / 64,
            ),
            haInfoCardsSmall(
              title: "Total Schools",
              value: "5",
              onT: () {},
            ),
          ],
        ),
      ),
    );
  }
}
