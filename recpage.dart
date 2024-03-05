import 'package:flutter/material.dart';
import 'package:learningdart/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecommendationPage(),
    );
  }
}

class RecommendationPage extends StatefulWidget {
  @override
  _RecommendationPageState createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  Map<String, double> genreRatings = {
    'Calm Places': 0.0,
    'Crowded Places': 0.0,
    'Adventure': 0.0,
    'Devotional': 0.0,
    'Shopping Centers': 0.0,
    'Restaurants': 0.0,
  };

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
              'Rate what u like!',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rate Each Category:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              for (var genre in genreRatings.keys)
                RatingCard(
                  genre: genre,
                  rating: genreRatings[genre]!,
                  onChanged: (double rating) {
                    setState(() {
                      genreRatings[genre] = rating;
                    });
                  },
                ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Handle submitting ratings
                  print('Genre Ratings: $genreRatings');

                  // Navigate to the HomePage
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange[300],
                ),
                child: Text(
                  'Submit Ratings',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RatingCard extends StatelessWidget {
  final String genre;
  final double rating;
  final ValueChanged<double> onChanged;

  RatingCard({
    required this.genre,
    required this.rating,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          genre,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Slider(
          value: rating,
          onChanged: onChanged,
          min: 0,
          max: 5,
          divisions: 5,
          label: rating.round().toString(),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
