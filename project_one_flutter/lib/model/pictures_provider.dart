import 'package:flutter/widgets.dart';

class PicturesProvider extends ChangeNotifier {
  int _imageNumber = 2;

  void moveRightPicture() {
    if (_imageNumber <= 9) {
      _imageNumber++;
    } else if (_imageNumber >= 10) {
      _imageNumber = 2;
    }
    notifyListeners();
  }

  void moveLeftPicture() {
    if (_imageNumber >= 3) {
      _imageNumber--;
    } else if (_imageNumber <= 2) {
      _imageNumber = 10;
    }
    notifyListeners();
  }

  String imageShow() {
    return 'images/modarixon$_imageNumber.jpg';
  }
}
