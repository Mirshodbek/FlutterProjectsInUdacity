import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_three_flutter/constants/constants_text.dart';
import 'package:project_three_flutter/model/enum.dart';
import 'package:project_three_flutter/model/provider/checking_answer_provider.dart';
import 'package:provider/provider.dart';

class MyHomePageProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CheckingProvider>(
      builder: (context, checking, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(kHeadText),
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    k1thQuestion,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: TextField(
                      controller: CheckingProvider.firstController,
                      onChanged: (answer) {
                        if (checking.getFirstAnswer() == answer) {
                          checking.getAnswer();
                        }
                      },
                      decoration: InputDecoration(
                        hintText: kHintText,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    k2thQuestion,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        value: 1,
                        groupValue: CheckingProvider.radioStateA,
                        onChanged: (value) {
                          checking.getPressed(Buttons.buttonA);
                        },
                      ),
                      Text(k2thA),
                      Radio(
                        value: 2,
                        groupValue: CheckingProvider.radioStateB,
                        onChanged: (value) {
                          checking.getPressed(Buttons.buttonB);
                        },
                      ),
                      Text(k2thB),
                      Radio(
                        activeColor: CheckingProvider.booleanButton
                            ? Colors.lightBlueAccent
                            : Colors.green,
                        value: 3,
                        groupValue: CheckingProvider.radioStateC,
                        onChanged: (value) {
                          checking.getPressed(Buttons.buttonC);
                          checking.getSecondAnswer(Buttons.buttonC);
                        },
                      ),
                      Text(
                        k2thC,
                        style: TextStyle(
                          color: CheckingProvider.booleanButton
                              ? null
                              : Colors.green,
                        ),
                      ),
                      Radio(
                        value: 4,
                        groupValue: CheckingProvider.radioStateD,
                        onChanged: (value) {
                          checking.getPressed(Buttons.buttonD);
                        },
                      ),
                      Text(k2thD),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    k3thQuestion,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: CheckingProvider.booleanButton
                            ? Colors.lightBlueAccent
                            : Colors.green,
                        value: CheckingProvider.boolean1,
                        onChanged: (checkBoxState) {
                          checking.getChecked(Checkboxes.checkboxA);
                          checking.getThirdAnswer();
                        },
                      ),
                      Flexible(
                        child: Text(
                          k3thA,
                          style: TextStyle(
                            color: CheckingProvider.booleanButton
                                ? null
                                : Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: CheckingProvider.boolean2,
                        onChanged: (checkBoxState) {
                          checking.getChecked(Checkboxes.checkboxB);
                        },
                      ),
                      Text(k3thB),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: CheckingProvider.booleanButton
                            ? Colors.lightBlueAccent
                            : Colors.green,
                        value: CheckingProvider.boolean3,
                        onChanged: (checkBoxState) {
                          checking.getChecked(Checkboxes.checkboxC);
                          checking.getThirdAnswer();
                        },
                      ),
                      Text(
                        k3thC,
                        style: TextStyle(
                          color: CheckingProvider.booleanButton
                              ? null
                              : Colors.green,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: CheckingProvider.boolean4,
                        onChanged: (checkBoxState) {
                          checking.getChecked(Checkboxes.checkboxD);
                        },
                      ),
                      Text(k3thD),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: CheckingProvider.boolean5,
                        onChanged: (checkBoxState) {
                          checking.getChecked(Checkboxes.checkboxE);
                        },
                      ),
                      Text(k3thE),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(
                      k4thQuestion,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: TextField(
                      controller: CheckingProvider.secondController,
                      onChanged: (answer) {
                        if (checking.getFourthAnswer() == answer) {
                          checking.getAnswer();
                        }
                      },
                      decoration: InputDecoration(hintText: kHintText),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[350],
                    ),
                    onPressed: CheckingProvider.booleanButton
                        ? () => checking.showResult(context)
                        : null,
                    child: Text(
                      kResultButton,
                      style: TextStyle(
                        color: CheckingProvider.booleanButton
                            ? Colors.black
                            : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
