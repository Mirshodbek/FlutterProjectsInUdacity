import 'package:flutter/material.dart';
import 'package:project_five_flutter/constants/constants_style.dart';
import 'package:project_five_flutter/constants/constants_text.dart';
import 'package:project_five_flutter/models/brain_app.dart';
import 'package:project_five_flutter/screens/home_screen.dart';
import 'package:project_five_flutter/screens/hotel_screen.dart';
import 'package:project_five_flutter/screens/restaurant_screen.dart';
import 'package:provider/provider.dart';

class DrawerNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 20,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              kDrawerHeadText1,
              style: kDrawerTextStyle1,
            ),
            accountEmail: Text(
              kDrawerHeadText2,
              style: kDrawerTextStyle2,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bukhara.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            selectedTileColor: Colors.grey[300],
            selected: true,
            leading: Icon(
              Icons.location_on,
            ),
            title: Text(
              kItem1,
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Navigator.pushNamed(context, MyHomePage.id);
            },
            dense: true,
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant_rounded,
            ),
            title: Text(kItem2),
            onTap: () {
              Navigator.pushNamed(context, RestaurantPage.id);
            },
            dense: true,
          ),
          ListTile(
            leading: Icon(
              Icons.hotel_rounded,
            ),
            title: Text(kItem3),
            onTap: () {
              Navigator.pushNamed(context, HotelPage.id);
            },
            dense: true,
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey[300],
          ),
          ListTile(
            title: Text(
              kSupport,
              style: kSupportItemTextStyle,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.email_sharp,
            ),
            title: Text(kItem4),
            onTap: () {
              Provider.of<BrainApp>(context, listen: false).customLaunch(
                'mailto:mirshod.bahromov@mail.ru?subject=test%20subject&body=test%20body',
              );
              Navigator.pop(context);
            },
            dense: true,
          ),
        ],
      ),
    );
  }
}
