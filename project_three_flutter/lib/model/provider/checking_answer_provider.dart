import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_three_flutter/model/enum.dart';
import 'package:project_three_flutter/toast/toast.dart';

class CheckingProvider extends ChangeNotifier {
  static final firstController = TextEditingController();
  static final secondController = TextEditingController();
  static int radioStateA = 0;
  static int radioStateB = 0;
  static int radioStateC = 0;
  static int radioStateD = 0;
  static bool boolean1 = false;
  static bool boolean2 = false;
  static bool boolean3 = false;
  static bool boolean4 = false;
  static bool boolean5 = false;
  static bool booleanButton = true;
  int _correctAnswer = 0;

  String getFirstAnswer() => 'Tomorrow';

  String getFourthAnswer() => 'Fire';

  void getPressed(Buttons buttons) {
    Buttons.buttonA == buttons ? radioStateA = 1 : radioStateA = 0;
    Buttons.buttonB == buttons ? radioStateB = 2 : radioStateB = 0;
    Buttons.buttonC == buttons ? radioStateC = 3 : radioStateC = 0;
    Buttons.buttonD == buttons ? radioStateD = 4 : radioStateD = 0;
    notifyListeners();
  }

  void getChecked(Checkboxes checkboxes) {
    switch (checkboxes) {
      case Checkboxes.checkboxA:
        boolean1 = !boolean1;
        break;
      case Checkboxes.checkboxB:
        boolean2 = !boolean2;
        break;
      case Checkboxes.checkboxC:
        boolean3 = !boolean3;
        break;
      case Checkboxes.checkboxD:
        boolean4 = !boolean4;
        break;
      case Checkboxes.checkboxE:
        boolean5 = !boolean5;
        break;
    }
    notifyListeners();
  }

  void getAnswer() {
    _correctAnswer++;
    notifyListeners();
  }

  void getSecondAnswer(Buttons radio) {
    if (Buttons.buttonC == radio) {
      _correctAnswer++;
    }
    notifyListeners();
  }

  void getThirdAnswer() {
    if (boolean1 && boolean3) {
      if (!boolean4 && !boolean2 && !boolean5) {
        _correctAnswer++;
      }
    }
    notifyListeners();
  }

  void showResult(BuildContext context) {
    ToastUtils.showCustomToast(
        context, "You have found $_correctAnswer answer");
    booleanButton = !booleanButton;
    firstController.text = 'Tomorrow';
    radioStateC = 3;
    boolean1 = true;
    boolean3 = true;
    secondController.text = 'Fire';
    notifyListeners();
  }
}
