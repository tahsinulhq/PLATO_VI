
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:plato_six/pages/overview/owidgets/OverviewLayout.dart';
import 'deptLayout.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class achVsFailChart extends StatefulWidget {
  final List<charts.Series<Ins_PloPerformance, String>> seriesList;
  final bool animate;


  achVsFailChart(this.seriesList, {required this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory achVsFailChart.withSampleData() {
    return new achVsFailChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,


    );
  }


  @override
  State<achVsFailChart> createState() => _achVsFailChartState();

  /// Create one series with sample hard coded data.
  static List<charts.Series<Ins_PloPerformance, String>> _createSampleData() {

    List list1 = achievedPlolist;
    List list2 = achievedPloPerlist;

    List list3 = failedPlolist;
    List list4 = failedPloPerlist;

    List<Ins_PloPerformance> AchievedPLO =[];
    for(int i =0; i< list1.length; i++){
      String a = list1[i];
      double  b = double.parse(list2[i]);

      AchievedPLO.add(Ins_PloPerformance(a, b));
    };



    List<Ins_PloPerformance> FailedPLO = [];
    for(int i =0; i< list3.length; i++){
      String a = list3[i];
      double  b = double.parse(list4[i]);

      FailedPLO.add(Ins_PloPerformance(a, b));
    };



    return [
      new charts.Series<Ins_PloPerformance, String>(
        id: 'Achieved PLO',
        domainFn: (Ins_PloPerformance sales, _) => sales.PLO,
        measureFn: (Ins_PloPerformance sales, _) => sales.Percentage,
        data: AchievedPLO,
        seriesColor: charts.ColorUtil.fromDartColor(Colors.green)




      ),
      new charts.Series<Ins_PloPerformance, String>(
        id: 'Failed PLO',
        domainFn: (Ins_PloPerformance sales, _) => sales.PLO,
        measureFn: (Ins_PloPerformance sales, _) => sales.Percentage,
        data: FailedPLO,
          seriesColor: charts.ColorUtil.fromDartColor(Colors.red)
      ),

    ];
  }
}

class _achVsFailChartState extends State<achVsFailChart> {


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