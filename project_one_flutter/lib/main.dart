import 'package:flutter/material.dart';
import 'package:project_one_flutter/model/pictures_provider.dart';
import 'package:project_one_flutter/screen/home_screen_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PicturesProvider(),
      child: MaterialApp(
        title: 'Project One in Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreenBloc(),
      ),
    );
  }
}
