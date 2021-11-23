import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';

class Pai extends StatefulWidget {
  @override
  _PieState createState() => _PieState();
}

class _PieState extends State<Pai> {

  Map kk={};
  List m;
  @override
  Widget build(BuildContext context) {
    kk=ModalRoute.of(context).settings.arguments;
    m=kk['info'];
    Map<String, double> dataMap = {
      "Total Active": (double.parse('${m[m.length-1]['totalconfirmed']}')-double.parse('${m[m.length-1]['totalrecovered']}')),
      "Total Recoverd": double.parse('${m[m.length-1]['totalrecovered']}'),
      "Total Deaths": double.parse('${m[m.length-1]['totaldeceased']}'),

    };
    return Scaffold(
        backgroundColor: Colors.grey[700],
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text("Pie chart Analysis",style: TextStyle(color: Colors.white),),
          centerTitle: true,

        ),
        body:Padding(
          padding: const EdgeInsets.all(20.0),
          child: PieChart(
            dataMap: dataMap,
            animationDuration: Duration(milliseconds: 1100),
            chartLegendSpacing: 40,
            chartRadius: MediaQuery.of(context).size.width / 1.3,
            colorList: [Colors.amber,Colors.tealAccent,Colors.redAccent[400]],
            initialAngleInDegree: 0,
            chartType: ChartType.ring,
            ringStrokeWidth: 40,
            centerText: "Covid-19",
            legendOptions: LegendOptions(
              showLegendsInRow: false,
              legendPosition: LegendPosition.bottom,
              showLegends: true,
              legendShape: BoxShape.circle,
              legendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.amberAccent[100],
                fontSize: 20,
              ),
            ),
            chartValuesOptions: ChartValuesOptions(
              showChartValueBackground: true,
              showChartValues: true,
              showChartValuesInPercentage: true,
              showChartValuesOutside: false,
              chartValueBackgroundColor: Colors.transparent,
              chartValueStyle: TextStyle(color: Colors.orangeAccent[400],fontSize: 15,fontWeight: FontWeight.bold),
              decimalPlaces: 0,

            ),
          ),
        )
    );
  }
}