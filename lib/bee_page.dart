import 'package:flutter/material.dart';

import 'bar_chart_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BeeChart extends StatelessWidget {
  const BeeChart({super.key});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "Spent",
        data: BarChartData.data,
        domainFn: (BarChartModel series, _) => series.day,
        measureFn: (BarChartModel series, _) => series.spent,
        colorFn: (BarChartModel series, _) => series.color,
      ),
    ];

    // Graph Stack
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: 750,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.amber.shade900,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Column(
            children: [
              // Package Title Bar
              Container(
                height: 50,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.amber.shade900,
                        Colors.amber.shade700,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(60))),
                child: Center(
                  child: Text(
                    "Package: Charts_Flutter",
                    textScaleFactor: 2,
                    style: TextStyle(
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.amber.shade900,
                          offset: const Offset(2, 2),
                          blurRadius: 2,
                        ),
                        Shadow(
                          color: Colors.amber.shade900,
                          offset: const Offset(-2, -2),
                          blurRadius: 2,
                        ),
                        Shadow(
                          color: Colors.amber.shade900,
                          offset: const Offset(-2, 2),
                          blurRadius: 2,
                        ),
                        Shadow(
                          color: Colors.amber.shade900,
                          offset: const Offset(2, -2),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Graph
              SizedBox(
                height: 500,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: charts.BarChart(
                    series,
                    animate: true,
                    primaryMeasureAxis: coloredYAxis,
                    domainAxis: coloredXAxis,
                  ),
                ),
              ),
              // Description
              Container(
                height: 230,
                decoration: BoxDecoration(
                    color: Colors.amber.shade600,
                    gradient: LinearGradient(
                      colors: [
                        Colors.amber.shade700,
                        Colors.amber.shade900,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(60))),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "Charts_Flutter, as the name implies, allows you to use a variety of charts to display data and even animate how it shows up. Here I have made a graph plotting what the Bee population would be today if I had been elected as World Dictator in 2010 at the impressive age of 12. Y axis is in trillions of bees.",
                    style: TextStyle(height: 2.3, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

charts.NumericAxisSpec get coloredYAxis => const charts.NumericAxisSpec(
      renderSpec: charts.GridlineRendererSpec(
        labelStyle: charts.TextStyleSpec(
          fontSize: 15,
          color: charts.MaterialPalette.white,
        ),
      ),
    );

charts.OrdinalAxisSpec get coloredXAxis => const charts.OrdinalAxisSpec(
      renderSpec: charts.GridlineRendererSpec(
        labelStyle: charts.TextStyleSpec(
          // fontSize: 15,
          color: charts.MaterialPalette.white,
        ),
        labelRotation: 45,
      ),
    );
