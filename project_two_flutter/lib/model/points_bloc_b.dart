import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_two_flutter/model/enum.dart';

class PointBlocB extends Cubit<int> {
  PointBlocB(int state) : super(state);
  int _pointTeamB = 0;
  void getPointB(Points selectedButton) {
    switch (selectedButton) {
      case Points.Six:
        emit(_pointTeamB += 6);
        break;
      case Points.Four:
        emit(_pointTeamB += 4);
        break;
      case Points.Two:
        emit(_pointTeamB += 2);
        break;
      case Points.Zero:
        emit(_pointTeamB = 0);
        break;
    }
  }
}
