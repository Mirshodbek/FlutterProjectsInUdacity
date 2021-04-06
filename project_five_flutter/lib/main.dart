import 'package:flutter/material.dart';
import 'package:project_five_flutter/models/brain_app.dart';
import 'package:project_five_flutter/screens/home_screen.dart';
import 'package:project_five_flutter/screens/hotel_screen.dart';
import 'package:project_five_flutter/screens/restaurant_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BrainApp(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.light().copyWith(
          primaryColor: Color(0xFFe0e0e0),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: MyHomePage(),
        initialRoute: MyHomePage.id,
        routes: {
          MyHomePage.id: (context) => MyHomePage(),
          RestaurantPage.id: (context) => RestaurantPage(),
          HotelPage.id: (context) => HotelPage(),
        },
      ),
    );
  }
}
