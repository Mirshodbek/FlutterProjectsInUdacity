import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_three_flutter/model/bloc/answer.dart';
import 'package:project_three_flutter/model/bloc/checking_answer_bloc_cubit.dart';
import 'package:project_three_flutter/model/provider/checking_answer_provider.dart';
import 'package:project_three_flutter/screen/home_screen_bloc_cubit.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CheckingProvider(),
      child: BlocProvider<BlocCubits>(
        create: (context) => BlocCubits(
            state: Answer(
          radio: 0,
          countCorrectAnswer: 0,
        )),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MyHomePageBloc(),
        ),
      ),
    );
  }
}
