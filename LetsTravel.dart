import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LetsTravelPage(),
    );
  }
}

class LetsTravelPage extends StatelessWidget {
  final List<TravelCardData> travelCardDataList = [
    TravelCardData(
      placeName: 'Beach Paradise',
      description: 'Relax and enjoy the sun, sand, and sea!',
      imageUrl: 'assets/beach_image.jpg',
    ),
    TravelCardData(
      placeName: 'Mountain Retreat',
      description: 'Experience breathtaking views and tranquility.',
      imageUrl: 'assets/mountain_image.jpg',
    ),
    // Add more TravelCardData for other places
  ];

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
                'C:\\Users\\asus\\Documents\\traveljinn\\learningdart\\lib\\bus\\logo.jpg', // Update with the correct path to your logo in the assets directory
                width: 30,
                height: 30,
              ),
            ),
            Text(
              'Places You Can Visit!',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the previous screen
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemCount: travelCardDataList.length,
          itemBuilder: (context, index) {
            return TravelCard(
              placeName: travelCardDataList[index].placeName,
              description: travelCardDataList[index].description,
              imageUrl: travelCardDataList[index].imageUrl,
            );
          },
        ),
      ),
    );
  }
}

class TravelCard extends StatelessWidget {
  final String placeName;
  final String description;
  final String imageUrl;

  TravelCard({
    required this.placeName,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    double imageHeight = MediaQuery.of(context).size.height * 0.3;

    return Card(
      elevation: 5.0,
      margin: EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            imageUrl,
            height: imageHeight,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  placeName,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  description,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TravelCardData {
  final String placeName;
  final String description;
  final String imageUrl;

  TravelCardData({
    required this.placeName,
    required this.description,
    required this.imageUrl,
  });
}
