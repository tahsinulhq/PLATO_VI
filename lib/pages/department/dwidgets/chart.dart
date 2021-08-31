import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class GroupedBarChart extends StatelessWidget {
  final List<charts.Series<Dept_PloAchvsAvg, String>> seriesList;
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
  static List<charts.Series<Dept_PloAchvsAvg, String>> _createSampleData() {
    final Student_plo = [
      new Dept_PloAchvsAvg('PLO 1', 20),
      new Dept_PloAchvsAvg('PLO 2', 25),
      new Dept_PloAchvsAvg('PLO 3', 100),
      new Dept_PloAchvsAvg('PLO 4', 75),
      new Dept_PloAchvsAvg('PLO 5', 50),
      new Dept_PloAchvsAvg('PLO 6', 45),
      new Dept_PloAchvsAvg('PLO 7', 92),
      new Dept_PloAchvsAvg('PLO 8', 34),
      new Dept_PloAchvsAvg('PLO 9', 80),
      new Dept_PloAchvsAvg('PLO 10', 52),
      new Dept_PloAchvsAvg('PLO 11', 69),
      new Dept_PloAchvsAvg('PLO 12', 48),
      new Dept_PloAchvsAvg('PLO 13', 72),
    ];

    final Course_average = [
      new Dept_PloAchvsAvg('PLO 1', 65),
      new Dept_PloAchvsAvg('PLO 2', 60),
      new Dept_PloAchvsAvg('PLO 3', 82),
      new Dept_PloAchvsAvg('PLO 4', 56),
      new Dept_PloAchvsAvg('PLO 5', 75),
      new Dept_PloAchvsAvg('PLO 6', 71),
      new Dept_PloAchvsAvg('PLO 7', 85),
      new Dept_PloAchvsAvg('PLO 8', 42),
      new Dept_PloAchvsAvg('PLO 9', 43),
      new Dept_PloAchvsAvg('PLO 10', 53),
      new Dept_PloAchvsAvg('PLO 11', 82),
      new Dept_PloAchvsAvg('PLO 12', 60),
      new Dept_PloAchvsAvg('PLO 13', 50),
    ];

    return [
      new charts.Series<Dept_PloAchvsAvg, String>(
        id: 'Plo 1',
        domainFn: (Dept_PloAchvsAvg sales, _) => sales.PLO,
        measureFn: (Dept_PloAchvsAvg sales, _) => sales.Percentage,
        data: Student_plo,
      ),
      new charts.Series<Dept_PloAchvsAvg, String>(
        id: 'Plo 2',
        domainFn: (Dept_PloAchvsAvg sales, _) => sales.PLO,
        measureFn: (Dept_PloAchvsAvg sales, _) => sales.Percentage,
        data: Course_average,
      ),
    ];
  }
}

/// Sample ordinal data type.
class Dept_PloAchvsAvg {
  final String PLO;
  final int Percentage;
  Dept_PloAchvsAvg(this.PLO, this.Percentage);
}
