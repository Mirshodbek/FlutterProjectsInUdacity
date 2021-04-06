import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_two_flutter/model/enum.dart';

class PointBlocA extends Cubit<int> {
  int _pointTeamA = 0;

  PointBlocA(int state) : super(state);

  void getPointA(Points selectedButton) {
    switch (selectedButton) {
      case Points.Six:
        emit(_pointTeamA += 6);
        break;
      case Points.Four:
        emit(_pointTeamA += 4);
        break;
      case Points.Two:
        emit(_pointTeamA += 2);
        break;
      case Points.Zero:
        emit(_pointTeamA = 0);
        break;
    }
  }
}
