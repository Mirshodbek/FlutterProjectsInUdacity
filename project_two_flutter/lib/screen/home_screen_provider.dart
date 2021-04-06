import 'package:flutter/material.dart';
import 'package:project_two_flutter/constants.dart';
import 'package:project_two_flutter/model/enum.dart';
import 'package:project_two_flutter/model/points_provider.dart';
import 'package:project_two_flutter/widget/widgets.dart';
import 'package:provider/provider.dart';

class MyHomePageProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PointsProvider>(
      builder: (context, points, child) {
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
                              Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  '${points.getTeamAResult()}',
                                  style: kPoinStyle,
                                ),
                              ),
                              TextButtons(
                                point: '+6 POINTS',
                                onPressed: () {
                                  points.getSixPoint(Button.TeamA);
                                },
                              ),
                              TextButtons(
                                point: '+4 POINTS',
                                onPressed: () {
                                  points.getFourPoint(Button.TeamA);
                                },
                              ),
                              TextButtons(
                                point: '+2 POINTS',
                                onPressed: () {
                                  points.getTwoPoint(Button.TeamA);
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
                              Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  '${points.getTeamBResult()}',
                                  style: kPoinStyle,
                                ),
                              ),
                              TextButtons(
                                point: '+6 POINTS',
                                onPressed: () {
                                  points.getSixPoint(Button.TeamB);
                                },
                              ),
                              TextButtons(
                                point: '+4 POINTS',
                                onPressed: () {
                                  points.getFourPoint(Button.TeamB);
                                },
                              ),
                              TextButtons(
                                point: '+2 POINTS',
                                onPressed: () {
                                  points.getTwoPoint(Button.TeamB);
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
                            points.getReset();
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
      },
    );
  }
}
