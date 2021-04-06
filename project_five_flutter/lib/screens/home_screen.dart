import 'package:flutter/material.dart';
import 'package:project_five_flutter/constants/constants_style.dart';
import 'package:project_five_flutter/constants/constants_text.dart';
import 'package:project_five_flutter/drawer/navigation_drawer.dart';
import 'package:project_five_flutter/info_screen/historical_places_info.dart';
import 'package:project_five_flutter/models/app_bar.dart';
import 'package:project_five_flutter/models/brain_app.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  static final String id = 'history_screen';
  @override
  Widget build(BuildContext context) {
    return Consumer<BrainApp>(
      builder: (context, brainApp, child) {
        return DefaultTabController(
          length: brainApp.tab.length,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                kAppBarTitle,
                style: kAppBarTextStyle,
              ),
              bottom: TabBar(
                indicatorColor: Colors.black,
                isScrollable: true,
                tabs: brainApp.tab.map((Choices choices) {
                  return Tab(
                    child: Text(
                      choices.title,
                      style: kAppBarTextStyle,
                    ),
                  );
                }).toList(),
              ),
            ),
            drawer: DrawerNavigation(),
            body: TabBarView(
              children: brainApp.tab.map((Choices choices) {
                return Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final list = brainApp.listModelHomeScreen[index];
                      return Card(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HistoryPage(
                                    index: index,
                                  ),
                                ),
                              );
                            },
                            leading: Container(
                              width: 60,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(list.image),
                                fit: BoxFit.fill,
                              )),
                            ),
                            title: Text(list.title),
                            subtitle: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                ),
                                Expanded(child: Text(list.subTitle)),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: brainApp.listModelHomeScreen.length,
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
