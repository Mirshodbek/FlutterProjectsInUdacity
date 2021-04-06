import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_six_flutter/key/key.dart';
import 'package:project_six_flutter/model/news.dart';
import 'package:project_six_flutter/network/network_helper.dart';

class BrainApp extends ChangeNotifier {
  List<News> setInfo = [];
  bool isLoading = true;
  bool info = false;
  bool checkInternet = false;

  Future<dynamic> getNewsData() async {
    NetworkHelper networkHelper = NetworkHelper(
      'https://content.guardianapis.com/search?&show-tags=contributor&api-key=$apiKey',
    );
    var newsData = await networkHelper.getData();
    isLoading = false;
    return newsData;
  }

  void getInfo() async {
    var newsInfo = await getNewsData();

    if (newsInfo != null) {
      var list = newsInfo['response']['results'];

      for (var data in list) {
        var tags = data['tags'];
        for (var author in tags) {
          setInfo.add(
            News(
              sectionName: data['sectionName'],
              author: author['webTitle'],
              webTitle: data['webTitle'],
              webPublicationDate: data['webPublicationDate'],
              webUrl: data['webUrl'],
              id: data['id'],
            ),
          );
        }
      }
    } else {
      info = true;
    }
    notifyListeners();
  }

  _showDialog(BuildContext context, title, text) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(text),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Widget build() {
    return Center(
      child: Container(
        child: Row(
          children: [
            Icon(
              Icons.wifi_off,
            ),
            Text('Please check your internet!')
          ],
        ),
      ),
    );
  }

  checkInternetConnectivity(BuildContext context) async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      _showDialog(context, 'No internet', "You're not connected to a network");
      checkInternet = true;
    } else if (result == ConnectivityResult.mobile) {
      await getNewsData();
      getInfo();
    } else if (result == ConnectivityResult.wifi) {
      await getNewsData();
      getInfo();
    }
  }

  Widget widgetNull() {
    return Center(
      child: Container(
        child: Text('No Information'),
      ),
    );
  }
}
