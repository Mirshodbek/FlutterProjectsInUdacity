import 'package:flutter/material.dart';
import 'package:project_five_flutter/constants/constants_style.dart';
import 'package:project_five_flutter/constants/constants_text.dart';
import 'package:project_five_flutter/drawer/navigation_drawer.dart';
import 'package:project_five_flutter/models/brain_app.dart';
import 'package:provider/provider.dart';

class RestaurantPage extends StatelessWidget {
  static final String id = 'restaurants_screen';

  @override
  Widget build(BuildContext context) {
    return Consumer<BrainApp>(
      builder: (context, brainApp, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Restaurants'),
          ),
          drawer: DrawerNavigation(),
          body: Container(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final restaurantList = brainApp.listRestaurantScreen[index];
                return Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        image: AssetImage(restaurantList.image),
                      ),
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
                      Text(
                        kInfoRestaurant,
                        style: kSupportItemTextStyle,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Text(
                            restaurantList.subTitle,
                            style: kSupportItemTextStyle,
                          )),
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: brainApp.listRestaurantScreen.length,
            ),
          ),
        );
      },
    );
  }
}
