import 'package:flutter/material.dart';
import 'package:project_four_flutter/toast/toast.dart';

class MusicProvider {
  String name;
  String author;
  bool button;
  bool musicButton;

  MusicProvider({
    this.name,
    this.author,
    this.button = false,
    this.musicButton = false,
  });

  getPressed() {
    button = !button;
  }

  void getPressMusic() {
    musicButton = !musicButton;
  }

  void showToast(BuildContext context) {
    String toast;
    if (button == true) {
      toast = 'Pause Music';
    } else if (musicButton == true) {
      toast = 'Now Playing';
    } else {
      toast = 'Stop Music';
    }
    ToastUtils.showCustomToast(context, toast);
  }
}
