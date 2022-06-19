import 'package:calculator/logic/calculator_logic.dart';
import 'package:calculator/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String result = '0',
      num1 = '',
      num2 = '',
      operator = '',
      input = '',
      equals = '';
  int stateControl = 1;

  void setInputBtnValue(String btnValue) => setState(() => input = btnValue);

  void btnPress(String btnValue) {
    List<String> operations = ['+', '-', '×', '÷'];

    if (!operations.contains(btnValue) &&
        btnValue != '.' &&
        btnValue != '=' &&
        btnValue != '±' &&
        btnValue != 'CE') {
      if (result == '0') {
        setState(() => result = '');
      }

      if (btnValue == '0' && (num1 == '0' || num2 == '0')) {
        setInputBtnValue(btnValue);
      } else if (btnValue != '0' && input == '0') {
        setInputBtnValue(btnValue);
      } else {
        setState(() => input += btnValue);
      }

      if (stateControl == 1) {
        num1 = input;
      } else {
        num2 += btnValue;
      }
    } else if (operations.contains(btnValue) &&
        num1.isNotEmpty &&
        num2.isEmpty) {
      operator = btnValue;
      stateControl = 2;
      setState(() => input += operator);
    } else if (btnValue == '.') {
      if (result == '0') {
        setState(() {
          result = '';
          input = '0.';
        });
      } else if (input == '0.') {
        setState(() => input = input);
      } else {
        if (stateControl == 1 && !num1.contains('.')) {
          setState(() => input = num1 + btnValue);
        } else if (stateControl == 2) {
          List<String> splitPoints = input.split('.');
          if (splitPoints.length <= 2) {
            setState(() {
              input += btnValue;
              num2 += btnValue;
            });
          }
        }
      }
    } else if (btnValue == '=') {
      setState(() => equals = '=');
      CalculatorLogic logic = CalculatorLogic();
      setState(() => result = logic.calculate(operator, num1, num2));
    } else if (btnValue == 'CE') {
      setState(() {
        result = '0';
        num1 = '';
        num2 = '';
        operator = '';
        input = '';
        stateControl = 1;
        equals = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CalculatorBodyWidget(
      btnPressed: btnPress,
      equals: equals,
      input: input,
      result: result,
    );
  }
}
