import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_four_flutter/constants/constants.dart';
import 'package:project_four_flutter/model/provider/data_provider.dart';
import 'package:provider/provider.dart';

class OperaPage extends StatelessWidget {
  static const String id = 'opera_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opera'),
      ),
      body: Consumer<DataProvider>(
        builder: (context, gridView, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final opera = gridView.listMusicsOpera[index];
              _icon() {
                if (opera.musicButton == true) {
                  opera.musicButton = false;
                  return Icons.play_circle_fill;
                } else if (opera.button == false) {
                  return Icons.play_circle_outline;
                } else if (opera.button == true) {
                  return Icons.pause;
                }
              }

              return ListTile(
                title: GestureDetector(
                  onTap: () {
                    gridView.getMusicPress(opera, context);
                  },
                  child: Text(
                    opera.name,
                    style: kMusicNameTextStyle,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      opera.author,
                      style: kMusicAuthorTextStyle,
                    ),
                    Visibility(
                      visible: opera.musicButton ? true : opera.button,
                      child: Text(
                        opera.button ? 'Pause Music' : 'Now Playing',
                      ),
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {
                    gridView.getPressed(opera, context);
                  },
                  icon: Icon(
                    _icon(),
                  ),
                ),
              );
            },
            itemCount: gridView.listMusicsOperaLength,
          );
        },
      ),
    );
  }
}
