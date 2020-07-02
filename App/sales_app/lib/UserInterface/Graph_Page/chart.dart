import 'package:flutter/cupertino.dart';
import 'package:salesapp/global/global.dart';
//import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class WeeklyChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: BarChart(
        BarChartData(
          barGroups: getBarGroups(),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            leftTitles: SideTitles(
              showTitles: false,
            ),
            bottomTitles: SideTitles(
              showTitles: true,
              getTitles: getWeek,
              textStyle: TextStyle(
                color: primaryBlue,
                fontSize: 10,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

getBarGroups() {
  List<double> barChartDatas = [6, 10, 8, 7, 10, 15, 9];
  List<BarChartGroupData> barChartGroups = [];
  barChartDatas.asMap().forEach(
        (i, value) => barChartGroups.add(
      BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            y: value,
            //This is not the proper way, this is just for demo
            color: i == 4 ? mediumBlue : kInactiveChartColor,
            width: 16,
          )
        ],
      ),
    ),
  );
  return barChartGroups;
}

String getWeek(double value) {
  switch (value.toInt()) {
    case 0:
      return 'LUN';
    case 1:
      return 'MAR';
    case 2:
      return 'MIE';
    case 3:
      return 'JUE';
    case 4:
      return 'VIE';
    case 5:
      return 'SAB';
    case 6:
      return 'DOM';
    default:
      return '';
  }
}
