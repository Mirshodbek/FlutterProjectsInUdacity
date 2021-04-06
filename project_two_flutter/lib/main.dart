import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_two_flutter/model/points_bloc_a.dart';
import 'package:project_two_flutter/model/points_bloc_b.dart';
import 'package:project_two_flutter/model/points_provider.dart';
import 'package:project_two_flutter/screen/home_screen_bloc_cubit.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Provider
    return ChangeNotifierProvider(
      create: (context) => PointsProvider(),
      //Bloc
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PointBlocA>(
            create: (context) => PointBlocA(0),
          ),
          BlocProvider<PointBlocB>(
            create: (context) => PointBlocB(0),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MyHomePageBlocCubit(),
        ),
      ),
    );
  }
}
