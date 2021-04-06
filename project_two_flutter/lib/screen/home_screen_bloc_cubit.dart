import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_two_flutter/constants.dart';
import 'package:project_two_flutter/model/enum.dart';
import 'package:project_two_flutter/model/points_bloc_a.dart';
import 'package:project_two_flutter/model/points_bloc_b.dart';
import 'package:project_two_flutter/widget/widgets.dart';

class MyHomePageBlocCubit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProjectTwo'),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/cricket1.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      'Cricket Score',
                      style: kBaseTextStyle,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Team A',
                            style: TextStyle(
                              color: Color(0xFF616161),
                            ),
                          ),
                          BlocBuilder<PointBlocA, int>(
                            builder: (context, points) => Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                '${points.toString()}',
                                style: kPoinStyle,
                              ),
                            ),
                          ),
                          TextButtons(
                            point: '+6 POINTS',
                            onPressed: () {
                              context.read<PointBlocA>().getPointA(Points.Six);
                            },
                          ),
                          TextButtons(
                            point: '+4 POINTS',
                            onPressed: () {
                              context.read<PointBlocA>().getPointA(Points.Four);
                            },
                          ),
                          TextButtons(
                            point: '+2 POINTS',
                            onPressed: () {
                              context.read<PointBlocA>().getPointA(Points.Two);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 7.5,
                      ),
                      Container(
                        width: 1,
                        height: 200,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 7.5,
                      ),
                      Column(
                        children: [
                          Text(
                            'Team B',
                            style: TextStyle(
                              color: Color(0xFF616161),
                            ),
                          ),
                          BlocBuilder<PointBlocB, int>(
                            builder: (context, points) => Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                '${points.toString()}',
                                style: kPoinStyle,
                              ),
                            ),
                          ),
                          TextButtons(
                            point: '+6 POINTS',
                            onPressed: () {
                              context.read<PointBlocB>().getPointB(Points.Six);
                            },
                          ),
                          TextButtons(
                            point: '+4 POINTS',
                            onPressed: () {
                              context.read<PointBlocB>().getPointB(Points.Four);
                            },
                          ),
                          TextButtons(
                            point: '+2 POINTS',
                            onPressed: () {
                              context.read<PointBlocB>().getPointB(Points.Two);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(18.0),
                    child: TextButton(
                      onPressed: () {
                        context.read<PointBlocA>().getPointA(Points.Zero);
                        context.read<PointBlocB>().getPointB(Points.Zero);
                      },
                      child: Text(
                        'RESET',
                        style: kBaseTextStyle.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
