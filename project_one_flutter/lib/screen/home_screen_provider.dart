import 'package:flutter/material.dart';
import 'package:project_one_flutter/constants.dart';
import 'package:project_one_flutter/model/pictures_provider.dart';
import 'package:project_one_flutter/widget/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreenProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PicturesProvider>(
      builder: (context, picture, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Hotel Modarixon'),
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        IconButtons(
                          iconData: Icons.arrow_back_ios,
                          onPressed: () {
                            picture.moveLeftPicture();
                          },
                        ),
                        Expanded(
                          child: Image(
                            gaplessPlayback: true,
                            image: AssetImage(
                              picture.imageShow(),
                            ),
                          ),
                        ),
                        IconButtons(
                          iconData: Icons.arrow_forward_ios,
                          onPressed: () {
                            picture.moveRightPicture();
                          },
                        ),
                      ],
                    ),
                  ),
                  RowHeader(
                    title: 'Modarixon',
                  ),
                  RowBody(
                    iconData: Icons.location_on,
                    text: 'Mehtar Ambar str.,Bukhara,Uzbekistan',
                  ),
                  RowHeader(
                    title: 'Services',
                  ),
                  RowBody(
                    iconData: Icons.wifi,
                    text: 'Wifi',
                  ),
                  RowBody(
                    iconData: Icons.restaurant,
                    text: 'Restaurant',
                  ),
                  RowBody(
                    iconData: Icons.local_bar,
                    text: 'Bar',
                  ),
                  RowBody(
                    iconData: Icons.free_breakfast,
                    text: 'Free Breakfast',
                  ),
                  RowBody(
                    iconData: Icons.room_service,
                    text: 'Room Service',
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.black,
                  ),
                  RowBody(
                    iconData: Icons.phone,
                    text: '+998 (78) 150-85-00',
                  ),
                  RowHeader(
                    title: 'Hotel description',
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: kDescriptionHotel,
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
