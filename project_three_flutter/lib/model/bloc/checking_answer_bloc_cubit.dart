import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_three_flutter/model/bloc/answer.dart';
import 'package:project_three_flutter/model/enum.dart';
import 'package:project_three_flutter/toast/toast.dart';

class BlocCubits extends Cubit<Answer> {
  static final firstController = TextEditingController();
  static final secondController = TextEditingController();
  int _countCorrectAnswer = 0;
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

  BlocCubits({Answer state}) : super(state);

  void firstAnswer(String value) {
    if (value == answer[0]) {
      _countCorrectAnswer++;
      emit(Answer(countCorrectAnswer: _countCorrectAnswer));
    }
  }

  void fourthAnswer(String value) {
    if (value == answer[1]) {
      _countCorrectAnswer++;
      emit(Answer(countCorrectAnswer: _countCorrectAnswer));
    }
  }

  void getPressed(Buttons buttons) {
    Buttons.buttonA == buttons ? radioStateA = 1 : radioStateA = 0;
    Buttons.buttonB == buttons ? radioStateB = 2 : radioStateB = 0;
    Buttons.buttonC == buttons ? radioStateC = 3 : radioStateC = 0;
    Buttons.buttonD == buttons ? radioStateD = 4 : radioStateD = 0;
    emit(Answer(radio: radioStateA));
    emit(Answer(radio: radioStateB));
    emit(Answer(radio: radioStateC));
    emit(Answer(radio: radioStateD));
  }

  void getSecondAnswer() {
    _countCorrectAnswer++;
    emit(Answer(countCorrectAnswer: _countCorrectAnswer));
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
    emit(Answer(
      checkBox1: boolean1,
      checkBox2: boolean2,
      checkBox3: boolean3,
      checkBox4: boolean4,
      checkBox5: boolean5,
    ));
  }

  void getThirdAnswer() {
    if (boolean1 && boolean3) {
      if (!boolean4 && !boolean2 && !boolean5) {
        _countCorrectAnswer++;
      }
    }
    emit(Answer(countCorrectAnswer: _countCorrectAnswer));
  }

  void showResult(BuildContext context) {
    ToastUtils.showCustomToast(
        context, "You have found $_countCorrectAnswer answer");
    booleanButton = !booleanButton;
    firstController.text = 'Tomorrow';
    radioStateC = 3;
    boolean1 = true;
    boolean3 = true;
    secondController.text = 'Fire';
    emit(Answer(
      checkBox1: boolean1,
      checkBox3: boolean3,
      radio: radioStateC,
      booleanButton: booleanButton,
    ));
  }
}

List<String> answer = ['Tomorrow', 'Fire'];
