import 'package:flutter/material.dart';
import 'package:learningdart/bus/taxi_tt.dart';
import 'package:learningdart/logo.dart';
import 'login.dart';
import 'signup.dart';
import 'recpage.dart';
import 'homepage.dart';
import 'BusTimeTable.dart';
import 'LetsTravel.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogoPage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(onSignUpSuccess: () {  },),
        '/recpage': (context) => RecommendationPage(),
        '/homepage': (context) => HomePage(),
        '/bustimetable': (context) => BusSchedulePage(busRoutes: [],),
        '/letstravel': (context) => LetsTravelPage(),
        '/taxitt': (context) => TaxiPage(routes: [],),
      },
    );
  }
}
