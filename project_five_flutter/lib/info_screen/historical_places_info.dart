import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_five_flutter/constants/constants_style.dart';
import 'package:project_five_flutter/constants/constants_text.dart';
import 'package:project_five_flutter/models/brain_app.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  final index;

  HistoryPage({@required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<BrainApp>(
      builder: (context, appBrain, child) {
        final listInfo = appBrain.infoHomeScreen[index];
        final listModal = appBrain.listModelHomeScreen[index];
        return Scaffold(
          appBar: AppBar(
            title: Text(
              listModal.title,
              style: kAppBarTextStyle,
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage(listModal.image),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    kTitleDescription,
                    style: kTitleInfoTextStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(listInfo.title),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    kTitleDetails,
                    style: kTitleInfoTextStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(kArkAccessTime),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Color(0xFF424242), Color(0xFFe0e0e0)],
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                        ),
                        Expanded(child: Text(listModal.subTitle)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
