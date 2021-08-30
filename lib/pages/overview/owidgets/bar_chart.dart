
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';


class GroupedBarChart extends StatelessWidget {
  final List<charts.Series<Ins_PloPerformance, String>> seriesList;
  final bool animate;

  GroupedBarChart(this.seriesList, {required this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory GroupedBarChart.withSampleData() {
    return new GroupedBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    // For horizontal bar charts, set the [vertical] flag to false.
    return new charts.BarChart(
      seriesList,
      animate: animate,
      vertical: true,
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<Ins_PloPerformance, String>> _createSampleData() {
    final Student_plo = [
      new Ins_PloPerformance('PLO 1', 20),
      new Ins_PloPerformance('PLO 2', 25),
      new Ins_PloPerformance('PLO 3', 100),
      new Ins_PloPerformance('PLO 4', 75),
      new Ins_PloPerformance('PLO 5', 50),
      new Ins_PloPerformance('PLO 6', 45),
      new Ins_PloPerformance('PLO 7', 92),
      new Ins_PloPerformance('PLO 8', 34),
      new Ins_PloPerformance('PLO 9', 80),
      new Ins_PloPerformance('PLO 10', 52),
      new Ins_PloPerformance('PLO 11', 69),
      new Ins_PloPerformance('PLO 12', 48),
      new Ins_PloPerformance('PLO 13', 72),
    ];

    final Course_average = [
      new Ins_PloPerformance('PLO 1', 65),
      new Ins_PloPerformance('PLO 2', 60),
      new Ins_PloPerformance('PLO 3', 82),
      new Ins_PloPerformance('PLO 4', 56),
      new Ins_PloPerformance('PLO 5', 75),
      new Ins_PloPerformance('PLO 6', 71),
      new Ins_PloPerformance('PLO 7', 85),
      new Ins_PloPerformance('PLO 8', 42),
      new Ins_PloPerformance('PLO 9', 43),
      new Ins_PloPerformance('PLO 10', 53),
      new Ins_PloPerformance('PLO 11', 82),
      new Ins_PloPerformance('PLO 12', 60),
      new Ins_PloPerformance('PLO 13', 50),
    ];




    return [
      new charts.Series<Ins_PloPerformance, String>(
        id: 'Plo 1',
        domainFn: (Ins_PloPerformance sales, _) => sales.PLO,
        measureFn: (Ins_PloPerformance sales, _) => sales.Percentage,
        data: Student_plo,

      ),
      new charts.Series<Ins_PloPerformance, String>(
        id: 'Plo 2',
        domainFn: (Ins_PloPerformance sales, _) => sales.PLO,
        measureFn: (Ins_PloPerformance sales, _) => sales.Percentage,
        data: Course_average,
      ),

    ];
  }
}

/// Sample ordinal data type.
class Ins_PloPerformance {
  final String PLO;
  final int Percentage;
  Ins_PloPerformance(this.PLO, this.Percentage);
}