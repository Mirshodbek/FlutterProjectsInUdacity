import 'package:flutter/cupertino.dart';
import 'package:project_two_flutter/model/enum.dart';

class PointsProvider extends ChangeNotifier {
  int _pointsTeamA = 0;
  int _pointsTeamB = 0;

  void getSixPoint(Button selectedButton) {
    switch (selectedButton) {
      case Button.TeamA:
        _pointsTeamA = _pointsTeamA + 6;
        break;
      case Button.TeamB:
        _pointsTeamB = _pointsTeamB + 6;
        break;
    }
    notifyListeners();
  }

  void getFourPoint(Button selectedButton) {
    switch (selectedButton) {
      case Button.TeamA:
        _pointsTeamA = _pointsTeamA + 4;
        break;
      case Button.TeamB:
        _pointsTeamB = _pointsTeamB + 4;
        break;
    }
    notifyListeners();
  }

  void getTwoPoint(Button selectedButton) {
    switch (selectedButton) {
      case Button.TeamA:
        _pointsTeamA = _pointsTeamA + 2;
        break;
      case Button.TeamB:
        _pointsTeamB = _pointsTeamB + 2;
        break;
    }
    notifyListeners();
  }

  String getTeamAResult() {
    return '$_pointsTeamA';
  }

  String getTeamBResult() {
    return '$_pointsTeamB';
  }

  void getReset() {
    _pointsTeamA = 0;
    _pointsTeamB = 0;
    notifyListeners();
  }
}
