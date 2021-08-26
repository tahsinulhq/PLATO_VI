import 'package:flutter/material.dart';
import 'package:plato_six/pages/overview/owidgets/info_cards.dart';


class OverviewCardsLargeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return  Row(
      children: [
        InfoCards(
          title: "Total Students",
          value: "100",
          onT: () {},
          topColor: Colors.orange,
        ),
        SizedBox(
          width: _width / 64,
        ),
        InfoCards(
          title: "Total PLO",
          value: "12",
          topColor: Colors.lightGreen,
          onT: () {},
        ),
        SizedBox(
          width: _width / 64,
        ),
        InfoCards(
          title: "Total CO",
          value: "4",
          topColor: Colors.redAccent,
          onT: () {},
        ),
        SizedBox(
          width: _width / 64,
        ),
        InfoCards(
          title: "Total Assessments",
          value: "15",
          onT: () {}, topColor: Colors.blueAccent,
        ),
      ],
    );
  }
}
