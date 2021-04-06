import 'package:flutter/material.dart';
import 'package:project_five_flutter/constants/constants_style.dart';
import 'package:project_five_flutter/constants/constants_text.dart';
import 'package:project_five_flutter/drawer/navigation_drawer.dart';
import 'package:project_five_flutter/info_screen/hotel_info.dart';
import 'package:project_five_flutter/models/brain_app.dart';
import 'package:provider/provider.dart';

class HotelPage extends StatelessWidget {
  static final String id = 'hotel_screen';
  @override
  Widget build(BuildContext context) {
    return Consumer<BrainApp>(
      builder: (context, brainApp, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              kAppBarTitle,
              style: kAppBarTextStyle,
            ),
          ),
          drawer: DrawerNavigation(),
          body: Container(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final list = brainApp.listModelHotelScreen[index];
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HotelPageInfo(
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
            ),
          ),
        );
      },
    );
  }
}
