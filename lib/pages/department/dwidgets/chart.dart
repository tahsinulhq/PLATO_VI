
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:plato_six/pages/overview/owidgets/OverviewLayout.dart';
import 'deptLayout.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class GroupedBarChart extends StatefulWidget {
  final List<charts.Series<Ins_PloPerformance, String>> seriesList;
  final bool animate;


  GroupedBarChart(this.seriesList, {required this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory GroupedBarChart.withSampleData() {
    return new GroupedBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,


    );
  }


  @override
  State<GroupedBarChart> createState() => _GroupedBarChartState();

  /// Create one series with sample hard coded data.
  static List<charts.Series<Ins_PloPerformance, String>> _createSampleData() {

    List list1 = studentPrPlolist;
    List list2 = studentPrPloPerlist;

    List list3 = coursePlolist;
    List list4 = coursePloPerlist;

    List<Ins_PloPerformance> Student_plo =[];
    for(int i =0; i< list1.length; i++){
      String a = list1[i];
      double  b = double.parse(list2[i]);

      Student_plo.add(Ins_PloPerformance(a, b));
    };



    List<Ins_PloPerformance> Course_average = [];
    for(int i =0; i< list3.length; i++){
      String a = list3[i];
      double  b = double.parse(list4[i]);

      Course_average.add(Ins_PloPerformance(a, b));
    };



    return [
      new charts.Series<Ins_PloPerformance, String>(
        id: 'Student PLO',
        domainFn: (Ins_PloPerformance sales, _) => sales.PLO,
        measureFn: (Ins_PloPerformance sales, _) => sales.Percentage,
        data: Student_plo,


      ),
      new charts.Series<Ins_PloPerformance, String>(
        id: 'Program Average',
        domainFn: (Ins_PloPerformance sales, _) => sales.PLO,
        measureFn: (Ins_PloPerformance sales, _) => sales.Percentage,
        data: Course_average,
      ),

    ];
  }
}

class _GroupedBarChartState extends State<GroupedBarChart> {


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