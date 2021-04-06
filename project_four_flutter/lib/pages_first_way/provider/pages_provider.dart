import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_four_flutter/constants/constants.dart';
import 'package:project_four_flutter/model/provider/data_provider.dart';
import 'package:provider/provider.dart';

class PagesProvider extends StatelessWidget {
  final indexes;

  PagesProvider(this.indexes);

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, gridView, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(gridView.listMusicCategory[indexes]),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              _button() {
                var music;
                switch (indexes) {
                  case 0:
                    music = gridView.listMusicsPop[index];
                    break;
                  case 1:
                    music = gridView.listMusicsJazz[index];
                    break;
                  case 2:
                    music = gridView.listMusicsOpera[index];
                    break;
                  case 3:
                    music = gridView.listMusicsRock[index];
                    break;
                }
                return music;
              }

              _icon() {
                if (_button().musicButton == true) {
                  _button().musicButton = false;
                  return Icons.play_circle_fill;
                } else if (_button().button == false) {
                  return Icons.play_circle_outline;
                } else if (_button().button == true) {
                  return Icons.pause;
                }
              }

              return ListTile(
                title: GestureDetector(
                  onTap: () {
                    gridView.getMusicPress(_button(), context);
                  },
                  child: Text(
                    gridView.getNameList(indexes, index),
                    style: kMusicNameTextStyle,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      gridView.getAuthorList(indexes, index),
                      style: kMusicAuthorTextStyle,
                    ),
                    Visibility(
                      visible: _button().musicButton ? true : _button().button,
                      child: Text(
                        _button().button ? 'Pause Music' : 'Now Playing',
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
                    gridView.getPressed(_button(), context);
                  },
                  icon: Icon(
                    _icon(),
                  ),
                ),
              );
            },
            itemCount: gridView.getLength(indexes),
          ),
        );
      },
    );
  }
}
