import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:project_four_flutter/model/provider/music_provider.dart';
import 'package:project_four_flutter/pages_second_way_provider/jazz_page.dart';
import 'package:project_four_flutter/pages_second_way_provider/opera_page.dart';
import 'package:project_four_flutter/pages_second_way_provider/pop_page.dart';
import 'package:project_four_flutter/pages_second_way_provider/rock_page.dart';

class DataProvider extends ChangeNotifier {
  List routers = [PopPage.id, JazzPage.id, OperaPage.id, RockPage.id];

  List<String> _listPhotoAlbum = [
    'images/album_classica.jpg',
    'images/album_jazz.jpg',
    'images/album_opera.jpg',
    'images/album_rock.jpg',
  ];

  UnmodifiableListView<String> get listPhotoAlbum =>
      UnmodifiableListView(_listPhotoAlbum);
  int get listPhotoAlbumCount {
    return _listPhotoAlbum.length;
  }

  List<String> _listMusicCategory = ['Pop', 'Jazz', 'Opera', 'Rock'];
  UnmodifiableListView<String> get listMusicCategory =>
      UnmodifiableListView(_listMusicCategory);

  List<MusicProvider> _listMusicsPop = [
    MusicProvider(name: "Wonder", author: "Shawn Mendes"),
    MusicProvider(name: "Dynamite", author: "BTS"),
    MusicProvider(name: "Holy", author: "Justin Bieber"),
    MusicProvider(name: "Still Have Me", author: "Demi Lovato"),
    MusicProvider(name: "Kings & Queens", author: "Ava Max"),
    MusicProvider(name: "Midnight Sky", author: "Miley Cyrus"),
    MusicProvider(name: "Watermelon Sugar", author: "Harry Styles"),
    MusicProvider(
        name: "Be Like That", author: "Kane Brown, Swate Lee, Khalid"),
    MusicProvider(name: "Ice Cream", author: "Selena Gomez"),
    MusicProvider(name: "Lovesick Girls", author: "BLACKPINK"),
    MusicProvider(name: "What a Feeling", author: "One Direction"),
    MusicProvider(name: "Adore You", author: "Harry Styles"),
  ];
  UnmodifiableListView<MusicProvider> get listMusicsPop =>
      UnmodifiableListView(_listMusicsPop);
  int get listMusicsPopLength {
    return _listMusicsPop.length;
  }

  List<MusicProvider> _listMusicsJazz = [
    MusicProvider(name: "So What", author: "Miles Davis"),
    MusicProvider(name: "Fly Me To The Moon", author: "Frank Sinatra"),
    MusicProvider(
        name: "Mood Indigo", author: "Duke Ellington & His Famous Orchestra"),
    MusicProvider(name: "Take Five", author: "Dave Brubeck Quartet"),
    MusicProvider(
        name: "The Girl From Ipanema", author: "Stan Getz & Joao Gilberto"),
    MusicProvider(name: "Minnie The Moocher", author: "Cab Calloway"),
    MusicProvider(name: "What A Wonderful World", author: "Louis Armstrong"),
    MusicProvider(name: "Strange Fruit", author: "Billie Holiday"),
    MusicProvider(name: "Georgia On My Mind", author: "Ray Charles"),
    MusicProvider(name: "My Baby Just Cares For Me", author: "Nina Simone"),
  ];
  UnmodifiableListView<MusicProvider> get listMusicsJazz =>
      UnmodifiableListView(_listMusicsJazz);
  int get listMusicsJazzLength {
    return _listMusicsJazz.length;
  }

  List<MusicProvider> _listMusicsOpera = [
    MusicProvider(name: "Eine kleine Nachtmusik", author: "Mozart"),
    MusicProvider(name: "Fur Elise", author: "Beethoven"),
    MusicProvider(name: "The Four Seasons", author: "Vivaldi"),
    MusicProvider(name: "Carmen", author: "Bizet"),
    MusicProvider(name: "Bolero", author: "Ravel"),
    MusicProvider(name: "Nessum Dorma", author: "Puccini"),
  ];
  UnmodifiableListView<MusicProvider> get listMusicsOpera =>
      UnmodifiableListView(_listMusicsOpera);
  int get listMusicsOperaLength {
    return _listMusicsOpera.length;
  }

  List<MusicProvider> _listMusicsRock = [
    MusicProvider(name: "Sweet Emotion", author: "Aerosmith"),
    MusicProvider(name: "Kashmir", author: "Led Zeppelin"),
    MusicProvider(name: "Gimme Shelter", author: "Rolling Stones"),
    MusicProvider(name: "A day in the Life", author: "The Beatles"),
    MusicProvider(name: "Bohemian Rhapsody", author: "Queen"),
    MusicProvider(name: "Everybody Wants Some!!", author: "Van Halen"),
    MusicProvider(name: "Comfortably Numb", author: "Pink Floyd"),
    MusicProvider(name: "Paranoid", author: "Black Sabbath"),
  ];
  UnmodifiableListView<MusicProvider> get listMusicsRock =>
      UnmodifiableListView(_listMusicsRock);
  int get listMusicsRockLength {
    return _listMusicsRock.length;
  }

  void getPressed(MusicProvider music, BuildContext context) {
    music.getPressed();
    music.showToast(context);
    notifyListeners();
  }

  void getMusicPress(MusicProvider music, BuildContext context) {
    music.getPressMusic();
    music.showToast(context);
    notifyListeners();
  }

  int getLength(int indexes) {
    int length = 0;
    switch (indexes) {
      case 0:
        length = listMusicsPopLength;
        break;
      case 1:
        length = listMusicsJazzLength;
        break;
      case 2:
        length = listMusicsOperaLength;
        break;
      case 3:
        length = listMusicsRockLength;
        break;
    }
    return length;
  }

  String getNameList(int indexes, int index) {
    String name;
    switch (indexes) {
      case 0:
        name = listMusicsPop[index].name;
        break;
      case 1:
        name = listMusicsJazz[index].name;
        break;
      case 2:
        name = listMusicsOpera[index].name;
        break;
      case 3:
        name = listMusicsRock[index].name;
        break;
    }
    return name;
  }

  String getAuthorList(int indexes, int index) {
    String author;
    switch (indexes) {
      case 0:
        author = listMusicsPop[index].author;
        break;
      case 1:
        author = listMusicsJazz[index].author;
        break;
      case 2:
        author = listMusicsOpera[index].author;
        break;
      case 3:
        author = listMusicsRock[index].author;
        break;
    }
    return author;
  }
}
