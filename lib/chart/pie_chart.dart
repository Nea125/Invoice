// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';

// class PieChartTest extends StatelessWidget {
//   final List<PieChartSectionData> pieChartData = [
//     PieChartSectionData(
//       value: 10,
//       color: Colors.blue,
//       title: 'Blue',
//       radius: 40,
//     ),
//     PieChartSectionData(
//       value: 30,
//       color: Colors.green,
//       title: 'Green',
//       radius: 40,
//     ),
//     PieChartSectionData(
//       value: 20,
//       color: Colors.red,
//       title: 'Red',
//       radius: 40,
//     ),
//     PieChartSectionData(
//       value: 10,
//       color: Colors.yellow,
//       title: 'Yellow',
//       radius: 40,
//     ),
//   ];

//    PieChartTest({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Pie Chart Sample'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: SizedBox(
//           width: 200,
//           child: PieChart(
//             PieChartData(
//               sections: pieChartData,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }










// import 'package:pie_chart/pie_chart.dart';
// import 'package:flutter/material.dart';
// class PieChartTest extends StatelessWidget {
//   PieChartTest({super.key});
//   final dataMap = <String, double>{
//     "Flutter": 15,
   
//   };

//   final colorList = <Color>[
//     Colors.greenAccent,
//   ];

//   @override 
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Create Pie Chart"),
//         centerTitle: true,
        
        
//       ),
//       body: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: PieChart(
//           centerText: "${74.00}\$",
//           ringStrokeWidth:12,
//           animationDuration: const Duration(seconds: 2),

//           dataMap: dataMap,
//           chartType: ChartType.ring,
//           chartRadius: 100,
//           baseChartColor: const Color.fromARGB(101, 158, 158, 158),
//           colorList: colorList,
//           chartValuesOptions: const ChartValuesOptions(
//             decimalPlaces: 2,
//             showChartValueBackground: false,
//             showChartValues: false,
//             showChartValuesInPercentage: true,
//           ),
//            totalValue:18, // the space over from data map in this int  over 4 value because flutter 16
        
//           legendOptions: const LegendOptions(
            
//             showLegends: false
//           ),
        
          
//         ),
//       ),
//     );
//   }
// }











import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';

class PieChartTest extends StatelessWidget {
  PieChartTest({super.key});
  final dataMap = <String, double>{
    "Flutter": 5,
    "React Native": 10,
    "Laravel": 20,
    "Kotlin": 30,
    "Java": 15
  };

  final colorList = <Color>[
    Colors.greenAccent,
    Colors.blue,
    Colors.red,
    Colors.pink,
    Colors.amber
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(17, 0, 0, 0),
        centerTitle: true,
        title: Text("Create piechart".toUpperCase()),
      ),
      body: Center(
        child: PieChart(
          dataMap: dataMap,
          animationDuration: const Duration(milliseconds: 800),
          chartLegendSpacing: 40,
          chartRadius: 150,
          colorList: colorList,
          initialAngleInDegree: 0,
          chartType: ChartType.ring,
          ringStrokeWidth: 32,
          centerText: "pie chart".toUpperCase(),
          legendOptions: const LegendOptions(
            
            showLegendsInRow: false,
            legendPosition: LegendPosition.right,
            showLegends: true,
            legendShape: BoxShape.rectangle,
            legendTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          chartValuesOptions: const ChartValuesOptions(
              showChartValueBackground: false,
              showChartValues: true,
              showChartValuesInPercentage: true,
              showChartValuesOutside: false,
              decimalPlaces: 2,
              
              chartValueStyle: TextStyle(fontSize: 14, color: Colors.black)),
          // gradientList: ---To add gradient colors---
          // emptyColorGradient: ---Empty Color gradient---
        ),
      ),
    );
  }
}
