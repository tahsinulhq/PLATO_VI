import 'package:flutter/material.dart';
import 'package:plato_six/pages/overview/owidgets/info_cards.dart';


class OverviewCardsLargeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return  Row(
      children: [
        InfoCards(
          title: "Rides in progress",
          value: "7",
          onT: () {},
          topColor: Colors.orange,
        ),
        SizedBox(
          width: _width / 64,
        ),
        InfoCards(
          title: "Packages delivered",
          value: "17",
          topColor: Colors.lightGreen,
          onT: () {},
        ),
        SizedBox(
          width: _width / 64,
        ),
        InfoCards(
          title: "Cancelled delivery",
          value: "3",
          topColor: Colors.redAccent,
          onT: () {},
        ),
        SizedBox(
          width: _width / 64,
        ),
        InfoCards(
          title: "Scheduled deliveries",
          value: "32",
          onT: () {}, topColor: Colors.blueAccent,
        ),
      ],
    );
  }
}
