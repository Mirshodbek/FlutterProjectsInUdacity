import 'package:flutter/material.dart';
import 'package:project_six_flutter/constants/constants.dart';
import 'package:project_six_flutter/key/key.dart';
import 'package:project_six_flutter/model/brain_app.dart';
import 'package:project_six_flutter/screens/web_screen.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String date;
    String time;
    return Consumer<BrainApp>(
      builder: (context, brainApp, child) {
        brainApp.checkInternetConnectivity(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('World News'),
          ),
          body: brainApp.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor, // Red
                    ),
                  ),
                )
              : brainApp.checkInternet
                  ? brainApp.build()
                  : brainApp.info
                      ? brainApp.widgetNull()
                      : Container(
                          padding: EdgeInsets.all(16.0),
                          child: RefreshIndicator(
                            onRefresh: () async {
                              await brainApp.checkInternetConnectivity(context);
                            },
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                final newsData = brainApp.setInfo[index];
                                String splitDate = newsData.webPublicationDate;
                                if (splitDate.contains(dateSeparator)) {
                                  List<String> parts =
                                      splitDate.split(dateSeparator);
                                  date = parts[0];
                                  time = parts[1].substring(0, 5);
                                } else {
                                  date = splitDate;
                                }
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => WebPage(
                                          index: index,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: 100,
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Type',
                                                    style: kTitleStyle,
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    '${newsData.sectionName}',
                                                    style: kInfoTextStyle,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Title',
                                                  style: kTitleStyle,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  '${newsData.author}',
                                                  style: kAuthorTextStyle,
                                                ),
                                                Text(
                                                  '${newsData.webTitle}',
                                                  style: kInfoTextStyle,
                                                  maxLines: 3,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Date',
                                                  style: kTitleStyle,
                                                ),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Text(
                                                  '$time',
                                                  style: kInfoTextStyle,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  '$date',
                                                  style: kInfoTextStyle,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 1,
                                        color: Colors.blue[900],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: 10,
                            ),
                          ),
                        ),
        );
      },
    );
  }
}
