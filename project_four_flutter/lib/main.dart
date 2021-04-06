import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_four_flutter/model/bloc_cubit/data_bloc_cubit.dart';
import 'package:project_four_flutter/model/provider/data_provider.dart';
import 'package:project_four_flutter/pages_first_way/provider/home_page_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataProvider>(
      create: (context) => DataProvider(),
      child: BlocProvider<DataBloc>(
        create: (context) => DataBloc(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MyHomePageProvider(),
          // second_way
          // initialRoute: MyHomePage.id,
          // routes: {
          //   MyHomePage.id: (context) => MyHomePage(),
          //   PopPage.id: (context) => PopPage(),
          //   JazzPage.id: (context) => JazzPage(),
          //   OperaPage.id: (context) => OperaPage(),
          //   RockPage.id: (context) => RockPage(),
          // },
        ),
      ),
    );
  }
}
