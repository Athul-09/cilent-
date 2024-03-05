import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class BusRoute {
  final String start;
  final String end;
  final String departureTime;

  BusRoute({
    required this.start,
    required this.end,
    required this.departureTime,
  });
}

class MyApp extends StatelessWidget {
  final List<BusRoute> busRoutes = [
    BusRoute(
      start: 'City A',
      end: 'City B',
      departureTime: '08:00 AM',
    ),
    // Add more bus routes here...
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bus Schedule',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BusSchedulePage(busRoutes: busRoutes),
    );
  }
}

class BusSchedulePage extends StatelessWidget {
  final List<BusRoute> busRoutes;

  BusSchedulePage({required this.busRoutes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset(
                'C:\\Users\\asus\\Documents\\traveljinn\\learningdart\\lib\\bus\\logo.jpg', // Update with the actual path to your logo
                width: 30,
                height: 30,
              ),
            ),
            Text(
              'Bus Schedule',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: [
            DataColumn(label: Text('Start')),
            DataColumn(label: Text('End')),
            DataColumn(label: Text('Departure Time')),
          ],
          rows: busRoutes.map((route) {
            return DataRow(cells: [
              DataCell(Text(route.start)),
              DataCell(Text(route.end)),
              DataCell(Text(route.departureTime)),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
