
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:plato_six/pages/overview/owidgets/OverviewLayout.dart';
import 'haOverviewGraphLayout.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class insPlo extends StatefulWidget {
  final List<charts.Series<Ins_PloPerformance, String>> seriesList;
  final bool animate;


  insPlo(this.seriesList, {required this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory insPlo.withSampleData() {
    return new insPlo(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,


    );
  }


  @override
  State<insPlo> createState() => _insPloState();

  /// Create one series with sample hard coded data.
  static List<charts.Series<Ins_PloPerformance, String>> _createSampleData() {

    List list1 = insPlolist;
    List list2 = insPloPerlist;

    // List list3 = insName;
    // List list4 = ins;

    List<Ins_PloPerformance> Student_plo =[];
    for(int i =0; i< list1.length; i++){
      String a = list1[i];
      double  b = double.parse(list2[i]);

      Student_plo.add(Ins_PloPerformance(a, b));
    };



    // List<Ins_PloPerformance> Course_average = [];
    // for(int i =0; i< list3.length; i++){
    //   String a = list3[i];
    //   double  b = double.parse(list4[i]);
    //
    //   Course_average.add(Ins_PloPerformance(a, b));
    // };



    return [
      new charts.Series<Ins_PloPerformance, String>(
        id: 'PLO Percentage',
        domainFn: (Ins_PloPerformance sales, _) => sales.PLO,
        measureFn: (Ins_PloPerformance sales, _) => sales.Percentage,
        data: Student_plo,


      ),
      // new charts.Series<Ins_PloPerformance, String>(
      //   id: 'Program Average',
      //   domainFn: (Ins_PloPerformance sales, _) => sales.PLO,
      //   measureFn: (Ins_PloPerformance sales, _) => sales.Percentage,
      //   data: Course_average,
      //
      // ),

    ];
  }
}

class _insPloState extends State<insPlo> {


  @override
  Widget build(BuildContext context) {

    // For horizontal bar charts, set the [vertical] flag to false.
    return new charts.BarChart(
      widget.seriesList,
      animate: widget.animate,
      vertical: true,
      barGroupingType: charts.BarGroupingType.grouped,
      behaviors: [new charts.SeriesLegend()],

    );
  }
}

/// Sample ordinal data type.
class Ins_PloPerformance {
  final String PLO;
  final double Percentage;
  Ins_PloPerformance(this.PLO, this.Percentage);
}