import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:project_five_flutter/constants/constants_text.dart';
import 'package:project_five_flutter/models/app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class BrainApp extends ChangeNotifier {
  List<Choices> _tab = [Choices(title: kTabBar1), Choices(title: kTabBar2)];

  UnmodifiableListView<Choices> get tab => UnmodifiableListView(_tab);
  List<ListModel> _listModelHomeScreen = [
    ListModel(
      image: kImageHomeScreen1,
      title: kTitleHomeScreen1,
      subTitle: kSubTitleHomeScreen1,
    ),
    ListModel(
      image: kImageHomeScreen2,
      title: kTitleHomeScreen2,
      subTitle: kSubTitleHomeScreen2,
    ),
    ListModel(
      image: kImageHomeScreen3,
      title: kTitleHomeScreen3,
      subTitle: kSubTitleHomeScreen3,
    ),
  ];

  UnmodifiableListView<ListModel> get listModelHomeScreen =>
      UnmodifiableListView(_listModelHomeScreen);

  List<Choices> _infoHomeScreen = [
    Choices(title: kArkDescription),
    Choices(title: kLabiHauzDescription),
    Choices(title: kMinoraiKalonDescription),
  ];

  UnmodifiableListView<Choices> get infoHomeScreen =>
      UnmodifiableListView(_infoHomeScreen);

  List<ListModel> _listModelHotelScreen = [
    ListModel(
      image: kImageHotelScreen1,
      title: kTitleHotelScreen1,
      subTitle: kSubTitleHomeScreen1,
    ),
    ListModel(
      image: kImageHotelScreen2,
      title: kTitleHotelScreen2,
      subTitle: kSubTitleHotelScreen2,
    ),
    ListModel(
      image: kImageHotelScreen3,
      title: kTitleHotelScreen3,
      subTitle: kSubTitleHotelScreen3,
    ),
  ];

  UnmodifiableListView<ListModel> get listModelHotelScreen =>
      UnmodifiableListView(_listModelHotelScreen);

  List<Choices> _infoHotelScreen = [
    Choices(title: kZargarondescription),
    Choices(title: kModarixonDescription),
    Choices(title: kMinoraiKalonHotelDescription),
  ];

  UnmodifiableListView<Choices> get infoHotelScreen =>
      UnmodifiableListView(_infoHotelScreen);

  List<ListModel> _listRestaurantScreen = [
    ListModel(
      image: kImageRestaurantScreen1,
      subTitle: kSubTitleRestaurantScreen1,
    ),
    ListModel(
      image: kImageRestaurantScreen2,
      subTitle: kSubTitleRestaurantScreen2,
    ),
    ListModel(
      image: kImageRestaurantScreen3,
      subTitle: kSubTitleRestaurantScreen3,
    ),
  ];

  UnmodifiableListView<ListModel> get listRestaurantScreen =>
      UnmodifiableListView(_listRestaurantScreen);

  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print(' could not launch $command');
    }
  }
}
