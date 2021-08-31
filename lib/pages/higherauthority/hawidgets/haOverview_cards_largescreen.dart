import 'package:flutter/material.dart';
import 'package:plato_six/pages/higherauthority/hawidgets/haInfo_cards.dart';

class haOverviewCardsLargeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        InfoCards(
          title: "Total Students",
          value: "30000",
          onT: () {},
          topColor: Colors.orange,
        ),
        SizedBox(
          width: _width / 64,
        ),
        InfoCards(
          title: "Total Departments",
          value: "13",
          topColor: Colors.lightGreen,
          onT: () {},
        ),
        SizedBox(
          width: _width / 64,
        ),
        InfoCards(
          title: "Total Programs",
          value: "35",
          topColor: Colors.redAccent,
          onT: () {},
        ),
        SizedBox(
          width: _width / 64,
        ),
        InfoCards(
          title: "Total Schools",
          value: "5",
          onT: () {},
          topColor: Colors.blueAccent,
        ),
      ],
    );
  }
}
