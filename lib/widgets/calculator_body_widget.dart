import 'package:calculator/themes/app_theme.dart';
import 'package:calculator/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CalculatorBodyWidget extends StatelessWidget {
  final Function btnPressed;
  final String equals, result, input;

  const CalculatorBodyWidget(
      {Key? key,
      required this.btnPressed,
      required this.equals,
      required this.input,
      required this.result})
      : super(key: key);

  TextStyle btnTextStyle({double fontSize = 60.0, Color color = Colors.white}) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
    );
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
                padding: EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                  top: MediaQuery.of(context).size.height * 0.050,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      equals,
                      style: btnTextStyle(color: AppTheme.operationsColor),
                    ),
                    Text(
                      result.length > 10 ? result.substring(0, 9) : result,
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
        ButtonsPadWidget(pressFnc: btnPressed),
      ],
    );
  }
}
