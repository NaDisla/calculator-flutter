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
      operator = '';
  int finalResult = 0;

  TextStyle btnTextStyle({double fontSize = 60.0, Color color = Colors.white}) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
    );
  }

  void btnPress(String btnValue) {
    List<String> operations = ['+', '-', '*', '/', '='];
    String concatResult = '';

    if (operations.contains(btnValue)) {
      switch (btnValue) {
        case '+':
          setState(() {
            operator = btnValue;
          });
          break;
        case '=':
          setState(() {
            finalResult = int.parse(num1) + int.parse(num2);
            result = finalResult.toString();
          });
          break;
      }
    } else {
      String concatNum1 = '',
          concatNum2 = '';
      if (result == '0') {
        setState(() {
          result = '';
          num1 = btnValue;
        });
      } else if (operator.isEmpty) {
        setState(() {
          concatNum1 += num1;
          num1 += btnValue;
        });
      }
      else {
        setState(() {
          concatNum2 += num2;
          num2 += btnValue;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Calculator Screen
        SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Result
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
                      '=',
                      style: btnTextStyle(color: AppTheme.operationsColor),
                    ),
                    Text(
                      result,
                      style: btnTextStyle(),
                    ),
                  ],
                ),
              ),
              //Operations
              Padding(
                padding: const EdgeInsets.only(right: 15.0, top: 40.0),
                child: Text(
                  '$num1 $operator $num2',
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
