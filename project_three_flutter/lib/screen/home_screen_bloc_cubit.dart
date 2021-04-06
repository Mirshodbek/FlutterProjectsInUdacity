import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_three_flutter/constants/constants_text.dart';
import 'package:project_three_flutter/model/bloc/answer.dart';
import 'package:project_three_flutter/model/bloc/checking_answer_bloc_cubit.dart';
import 'package:project_three_flutter/model/enum.dart';

class MyHomePageBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocCubits, Answer>(
      builder: (context, check) => Scaffold(
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
                    controller: BlocCubits.firstController,
                    onChanged: (answer) {
                      context.read<BlocCubits>().firstAnswer(answer);
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
                      groupValue: BlocCubits.radioStateA,
                      onChanged: (value) {
                        context.read<BlocCubits>().getPressed(Buttons.buttonA);
                      },
                    ),
                    Text(k2thA),
                    Radio(
                      value: 2,
                      groupValue: BlocCubits.radioStateB,
                      onChanged: (value) {
                        context.read<BlocCubits>().getPressed(Buttons.buttonB);
                      },
                    ),
                    Text(k2thB),
                    Radio(
                      activeColor: BlocCubits.booleanButton
                          ? Colors.lightBlueAccent
                          : Colors.green,
                      value: 3,
                      groupValue: BlocCubits.radioStateC,
                      onChanged: (value) {
                        context.read<BlocCubits>().getPressed(Buttons.buttonC);
                        context.read<BlocCubits>().getSecondAnswer();
                      },
                    ),
                    Text(
                      k2thC,
                      style: TextStyle(
                        color: BlocCubits.booleanButton ? null : Colors.green,
                      ),
                    ),
                    Radio(
                      value: 4,
                      groupValue: BlocCubits.radioStateD,
                      onChanged: (value) {
                        context.read<BlocCubits>().getPressed(Buttons.buttonD);
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
                      activeColor: BlocCubits.booleanButton
                          ? Colors.lightBlueAccent
                          : Colors.green,
                      value: BlocCubits.boolean1,
                      onChanged: (checkBoxState) {
                        context
                            .read<BlocCubits>()
                            .getChecked(Checkboxes.checkboxA);
                        context.read<BlocCubits>().getThirdAnswer();
                      },
                    ),
                    Flexible(
                      child: Text(
                        k3thA,
                        style: TextStyle(
                          color: BlocCubits.booleanButton ? null : Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: BlocCubits.boolean2,
                      onChanged: (checkBoxState) {
                        context
                            .read<BlocCubits>()
                            .getChecked(Checkboxes.checkboxB);
                      },
                    ),
                    Text(k3thB),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: BlocCubits.booleanButton
                          ? Colors.lightBlueAccent
                          : Colors.green,
                      value: BlocCubits.boolean3,
                      onChanged: (checkBoxState) {
                        context
                            .read<BlocCubits>()
                            .getChecked(Checkboxes.checkboxC);
                        context.read<BlocCubits>().getThirdAnswer();
                      },
                    ),
                    Text(
                      k3thC,
                      style: TextStyle(
                        color: BlocCubits.booleanButton ? null : Colors.green,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: BlocCubits.boolean4,
                      onChanged: (checkBoxState) {
                        context
                            .read<BlocCubits>()
                            .getChecked(Checkboxes.checkboxD);
                      },
                    ),
                    Text(k3thD),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: BlocCubits.boolean5,
                      onChanged: (checkBoxState) {
                        context
                            .read<BlocCubits>()
                            .getChecked(Checkboxes.checkboxE);
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
                    controller: BlocCubits.secondController,
                    onChanged: (answer) {
                      context.read<BlocCubits>().fourthAnswer(answer);
                    },
                    decoration: InputDecoration(hintText: kHintText),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[350],
                  ),
                  onPressed: BlocCubits.booleanButton
                      ? () => context.read<BlocCubits>().showResult(context)
                      : null,
                  child: Text(
                    kResultButton,
                    style: TextStyle(
                      color:
                          BlocCubits.booleanButton ? Colors.black : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
