import 'package:flutter/material.dart';
import 'package:project_six_flutter/model/brain_app.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatelessWidget {
  final index;

  WebPage({this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<BrainApp>(
      builder: (context, brainApp, child) {
        brainApp.getInfo();
        return Scaffold(
          appBar: AppBar(
            title: Text(brainApp.setInfo[index].webTitle),
          ),
          body: Builder(
            builder: (BuildContext context) {
              return WebView(
                initialUrl:
                    "https://www.theguardian.com/${brainApp.setInfo[index].id}",
                javascriptMode: JavascriptMode.unrestricted,
              );
            },
          ),
        );
      },
    );
  }
}
