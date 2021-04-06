import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_four_flutter/constants/constants.dart';
import 'package:project_four_flutter/model/provider/data_provider.dart';
import 'package:provider/provider.dart';

class JazzPage extends StatelessWidget {
  static const String id = 'jazz_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jazz'),
      ),
      body: Consumer<DataProvider>(
        builder: (context, gridView, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final jazz = gridView.listMusicsJazz[index];
              _icon() {
                if (jazz.musicButton == true) {
                  jazz.musicButton = false;
                  return Icons.play_circle_fill;
                } else if (jazz.button == false) {
                  return Icons.play_circle_outline;
                } else if (jazz.button == true) {
                  return Icons.pause;
                }
              }

              return ListTile(
                title: GestureDetector(
                  onTap: () {
                    gridView.getMusicPress(jazz, context);
                  },
                  child: Text(
                    jazz.name,
                    style: kMusicNameTextStyle,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      jazz.author,
                      style: kMusicAuthorTextStyle,
                    ),
                    Visibility(
                      visible: jazz.musicButton ? true : jazz.button,
                      child: Text(
                        jazz.button ? 'Pause Music' : 'Now Playing',
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
                    gridView.getPressed(jazz, context);
                  },
                  icon: Icon(
                    _icon(),
                  ),
                ),
              );
            },
            itemCount: gridView.listMusicsJazzLength,
          );
        },
      ),
    );
  }
}
