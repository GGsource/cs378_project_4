import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class BarChartModel {
  String day;
  double spent;
  final charts.Color color;

  BarChartModel({required this.day, required this.spent, required this.color});
}

class BarChartData {
  static final List<BarChartModel> data = [
    BarChartModel(
      day: "2012",
      spent: 2,
      color: charts.ColorUtil.fromDartColor(Colors.amber.shade200),
    ),
    BarChartModel(
      day: "2013",
      spent: 2.2,
      color: charts.ColorUtil.fromDartColor(Colors.amber.shade700),
    ),
    BarChartModel(
      day: "2014",
      spent: 3.6,
      color: charts.ColorUtil.fromDartColor(Colors.amber.shade200),
    ),
    BarChartModel(
      day: "2015",
      spent: 5.5,
      color: charts.ColorUtil.fromDartColor(Colors.amber.shade700),
    ),
    BarChartModel(
      day: "2016",
      spent: 7.9,
      color: charts.ColorUtil.fromDartColor(Colors.amber.shade200),
    ),
    BarChartModel(
      day: "2017",
      spent: 13,
      color: charts.ColorUtil.fromDartColor(Colors.amber.shade700),
    ),
    BarChartModel(
      day: "2018",
      spent: 3,
      color: charts.ColorUtil.fromDartColor(Colors.amber.shade200),
    ),
    BarChartModel(
      day: "2019",
      spent: 21,
      color: charts.ColorUtil.fromDartColor(Colors.amber.shade700),
    ),
    BarChartModel(
      day: "2020",
      spent: 43,
      color: charts.ColorUtil.fromDartColor(Colors.amber.shade200),
    ),
    BarChartModel(
      day: "2021",
      spent: 92,
      color: charts.ColorUtil.fromDartColor(Colors.amber.shade700),
    ),
    BarChartModel(
      day: "2022",
      spent: 170,
      color: charts.ColorUtil.fromDartColor(Colors.amber.shade200),
    ),
  ];
}
