import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_four_flutter/constants/constants.dart';
import 'package:project_four_flutter/model/provider/data_provider.dart';
import 'package:provider/provider.dart';

class PopPage extends StatelessWidget {
  static const String id = 'pop_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pop'),
      ),
      body: Consumer<DataProvider>(
        builder: (context, gridView, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final pop = gridView.listMusicsPop[index];
              _icon() {
                if (pop.musicButton == true) {
                  pop.musicButton = false;
                  return Icons.play_circle_fill;
                } else if (pop.button == false) {
                  return Icons.play_circle_outline;
                } else if (pop.button == true) {
                  return Icons.pause;
                }
              }

              return ListTile(
                title: GestureDetector(
                  onTap: () {
                    gridView.getMusicPress(pop, context);
                  },
                  child: Text(
                    pop.name,
                    style: kMusicNameTextStyle,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      pop.author,
                      style: kMusicAuthorTextStyle,
                    ),
                    Visibility(
                      visible: pop.musicButton ? true : pop.button,
                      child: Text(
                        pop.button ? 'Pause Music' : 'Now Playing',
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
                    gridView.getPressed(pop, context);
                  },
                  icon: Icon(
                    _icon(),
                  ),
                ),
              );
            },
            itemCount: gridView.listMusicsPopLength,
          );
        },
      ),
    );
  }
}
