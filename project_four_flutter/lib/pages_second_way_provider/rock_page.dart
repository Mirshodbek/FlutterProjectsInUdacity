import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_four_flutter/constants/constants.dart';
import 'package:project_four_flutter/model/provider/data_provider.dart';
import 'package:provider/provider.dart';

class RockPage extends StatelessWidget {
  static const String id = 'rock_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rock'),
      ),
      body: Consumer<DataProvider>(
        builder: (context, gridView, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final rock = gridView.listMusicsRock[index];
              _icon() {
                if (rock.musicButton == true) {
                  rock.musicButton = false;
                  return Icons.play_circle_fill;
                } else if (rock.button == false) {
                  return Icons.play_circle_outline;
                } else if (rock.button == true) {
                  return Icons.pause;
                }
              }

              return ListTile(
                title: GestureDetector(
                  onTap: () {
                    gridView.getMusicPress(rock, context);
                  },
                  child: Text(
                    rock.name,
                    style: kMusicNameTextStyle,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      rock.author,
                      style: kMusicAuthorTextStyle,
                    ),
                    Visibility(
                      visible: rock.musicButton ? true : rock.button,
                      child: Text(
                        rock.button ? 'Pause Music' : 'Now Playing',
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
                    gridView.getPressed(rock, context);
                  },
                  icon: Icon(
                    _icon(),
                  ),
                ),
              );
            },
            itemCount: gridView.listMusicsRockLength,
          );
        },
      ),
    );
  }
}
