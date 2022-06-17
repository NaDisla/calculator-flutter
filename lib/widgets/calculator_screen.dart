import 'package:calculator/themes/app_theme.dart';
import 'package:calculator/widgets/buttons_widget.dart';
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

  TextStyle btnTextStyle({double fontSize = 60.0, Color color = Colors.white}) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
    );
  }

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
        setState(() => input = btnValue);
      } else if (btnValue != '0' && input == '0') {
        setState(() => input = btnValue);
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
      setState(() {
        input += operator;
      });
    } else if (btnValue == '.') {
      if (result == '0') {
        setState(() {
          result = '';
          input = '0.';
        });
      } else if (input == '0.') {
        setState(() {
          input = input;
        });
      } else {
        if (stateControl == 1 && !num1.contains('.')) {
          setState(() {
            input = num1 + btnValue;
          });
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

      switch (operator) {
        case '+':
          setState(() {
            result = (double.parse(num1) + double.parse(num2)).toString();
          });
          break;
        case '-':
          setState(() {
            result = (double.parse(num1) - double.parse(num2)).toString();
          });
          break;
        case '×':
          setState(() {
            result = (double.parse(num1) * double.parse(num2)).toString();
          });
          break;
        case '÷':
          setState(() {
            result = (double.parse(num1) / double.parse(num2)).toString();
          });
          break;
      }
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
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                  top: 50.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      equals,
                      style: btnTextStyle(color: AppTheme.operationsColor),
                    ),
                    Text(
                      result,
                      style: btnTextStyle(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0, top: 40.0),
                child: Text(
                  input,
                  style: btnTextStyle(fontSize: 30.0),
                ),
              ),
            ],
          ),
        ),
        ButtonsPadWidget(pressFnc: btnPress),
      ],
    );
  }
}
