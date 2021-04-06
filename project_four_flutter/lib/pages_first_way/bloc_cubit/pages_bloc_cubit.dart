import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_four_flutter/constants/constants.dart';
import 'package:project_four_flutter/model/bloc_cubit/data_bloc_cubit.dart';
import 'package:project_four_flutter/model/bloc_cubit/music_bloc.dart';
import 'package:project_four_flutter/model/provider/data_provider.dart';
import 'package:provider/provider.dart';

class PagesBloc extends StatelessWidget {
  final indexes;

  PagesBloc(this.indexes);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, MusicBloc>(
      builder: (context, dataBloc) {
        int getLength() {
          int length = 0;
          switch (indexes) {
            case 0:
              length = dataBloc.listMusicsPopName.length;
              break;
            case 1:
              length = dataBloc.listMusicsJazzName.length;
              break;
            case 2:
              length = dataBloc.listMusicsOperaName.length;
              break;
            case 3:
              length = dataBloc.listMusicsRockName.length;
              break;
          }
          return length;
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(dataBloc.nameAlbum[indexes]),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              String getNameList() {
                var name;
                switch (indexes) {
                  case 0:
                    name = dataBloc.listMusicsPopName[index];
                    break;
                  case 1:
                    name = dataBloc.listMusicsJazzName[index];
                    break;
                  case 2:
                    name = dataBloc.listMusicsOperaName[index];
                    break;
                  case 3:
                    name = dataBloc.listMusicsRockName[index];
                    break;
                }
                return name;
              }

              String getAuthorList() {
                String author;
                switch (indexes) {
                  case 0:
                    author = dataBloc.listMusicsPopAuthor[index];
                    break;
                  case 1:
                    author = dataBloc.listMusicsJazzAuthor[index];
                    break;
                  case 2:
                    author = dataBloc.listMusicsOperaAuthor[index];
                    break;
                  case 3:
                    author = dataBloc.listMusicsRockAuthor[index];
                    break;
                }
                return author;
              }

              return Consumer<DataProvider>(
                builder: (context, gridView, child) {
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
                        getNameList(),
                        style: kMusicNameTextStyle,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          getAuthorList(),
                          style: kMusicAuthorTextStyle,
                        ),
                        Visibility(
                          visible:
                              _button().musicButton ? true : _button().button,
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
              );
            },
            itemCount: getLength(),
          ),
        );
      },
    );
  }
}
