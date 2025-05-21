import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _SalesData {
  String sales;
  String year;

  _SalesData(this.sales, this.year);
}

class _HomeScreenState extends State<HomeScreen> {
  List<_SalesData> data = [
    _SalesData('Jan', "35"),
    _SalesData('Feb', "28"),
    _SalesData('Mar', "34"),
    _SalesData('Apr', "32"),
    _SalesData('May', "40"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Tableau de bord", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15.5)),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15.5)),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15.5)),
                    ),
                  ),
                ],
              ),
              // Column(
              //   children: [
              //     //Initialize the chart widget
              //     SfCartesianChart(
              //       primaryXAxis: CategoryAxis(),
              //       // Chart title
              //       title: ChartTitle(text: 'Half yearly sales analysis'),
              //       // Enable legend
              //       legend: Legend(isVisible: true),
              //       // Enable tooltip
              //       tooltipBehavior: TooltipBehavior(enable: true),
              //       series: <CartesianSeries<_SalesData, String>>[
              //         LineSeries<_SalesData, String>(
              //           dataSource: data,
              //           xValueMapper: (_SalesData sales, _) => sales.year,
              //           yValueMapper: (_SalesData sales, _) => sales.sales,
              //           name: 'Sales',
              //           // Enable data label
              //           dataLabelSettings: DataLabelSettings(isVisible: true),
              //         ),
              //       ],
              //     ),
              //     Expanded(
              //       child: Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         //Initialize the spark charts widget
              //         child: SfSparkLineChart.custom(
              //           //Enable the trackball
              //           trackball: SparkChartTrackball(
              //             activationMode: SparkChartActivationMode.tap,
              //           ),
              //           //Enable marker
              //           marker: SparkChartMarker(
              //             displayMode: SparkChartMarkerDisplayMode.all,
              //           ),
              //           //Enable data label
              //           labelDisplayMode: SparkChartLabelDisplayMode.all,
              //           xValueMapper: (int index) => data[index].year,
              //           yValueMapper: (int index) => data[index].sales,
              //           dataCount: 5,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
    ;
  }
}
