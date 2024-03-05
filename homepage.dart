import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learningdart/BusTimeTable.dart';
import 'package:learningdart/LetsTravel.dart';
import 'package:learningdart/bus/taxi_tt.dart'; // Import SystemNavigator

class HomePage extends StatelessWidget {
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
              'Travel App',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Exit the app
              SystemNavigator.pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Grid for the first three options
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              shrinkWrap: true,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the "Bus Timings" page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BusSchedulePage(busRoutes: [],)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    'Bus Timings',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the "Bus/Taxi Page" page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TaxiPage(routes: [],)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    'Bus/Taxi Page',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the "Lets Travel" page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LetsTravelPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    'Lets Travel',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 32.0),
            // Section for Past Travels
            Text(
              'Past Travels',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  PastTravelItem(name: 'City A'),
                  PastTravelItem(name: 'City B'),
                  PastTravelItem(name: 'City C'),
                  // Add more PastTravelItem widgets as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PastTravelItem extends StatelessWidget {
  final String name;

  PastTravelItem({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.orange[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
