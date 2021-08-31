import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GroupedBarChart extends StatelessWidget {
  final List<charts.Series<HA_StPloPerformance, String>> seriesList;
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
  static List<charts.Series<HA_StPloPerformance, String>> _createSampleData() {
    final Student_plo = [
      new HA_StPloPerformance('PLO 1', 20),
      new HA_StPloPerformance('PLO 2', 25),
      new HA_StPloPerformance('PLO 3', 100),
      new HA_StPloPerformance('PLO 4', 75),
      new HA_StPloPerformance('PLO 5', 50),
      new HA_StPloPerformance('PLO 6', 45),
      new HA_StPloPerformance('PLO 7', 92),
      new HA_StPloPerformance('PLO 8', 34),
      new HA_StPloPerformance('PLO 9', 80),
      new HA_StPloPerformance('PLO 10', 52),
      new HA_StPloPerformance('PLO 11', 69),
      new HA_StPloPerformance('PLO 12', 48),
      new HA_StPloPerformance('PLO 13', 72),
    ];

    final Course_average = [
      new HA_StPloPerformance('PLO 1', 65),
      new HA_StPloPerformance('PLO 2', 60),
      new HA_StPloPerformance('PLO 3', 82),
      new HA_StPloPerformance('PLO 4', 56),
      new HA_StPloPerformance('PLO 5', 75),
      new HA_StPloPerformance('PLO 6', 71),
      new HA_StPloPerformance('PLO 7', 85),
      new HA_StPloPerformance('PLO 8', 42),
      new HA_StPloPerformance('PLO 9', 43),
      new HA_StPloPerformance('PLO 10', 53),
      new HA_StPloPerformance('PLO 11', 82),
      new HA_StPloPerformance('PLO 12', 60),
      new HA_StPloPerformance('PLO 13', 50),
    ];

    return [
      new charts.Series<HA_StPloPerformance, String>(
        id: 'Plo 1',
        domainFn: (HA_StPloPerformance sales, _) => sales.PLO,
        measureFn: (HA_StPloPerformance sales, _) => sales.Percentage,
        data: Student_plo,
      ),
      new charts.Series<HA_StPloPerformance, String>(
        id: 'Plo 2',
        domainFn: (HA_StPloPerformance sales, _) => sales.PLO,
        measureFn: (HA_StPloPerformance sales, _) => sales.Percentage,
        data: Course_average,
      ),
    ];
  }
}

class HA_StPloPerformance {
  final String PLO;
  final int Percentage;
  HA_StPloPerformance(this.PLO, this.Percentage);
}
