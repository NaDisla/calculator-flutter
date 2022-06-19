import 'package:flutter/material.dart';
import 'package:calculator/themes/app_theme.dart';

class ButtonsPadWidget extends StatelessWidget {
  final Function pressFnc;

  const ButtonsPadWidget({Key? key, required this.pressFnc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 5.0,
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  buildButton(
                    btnValue: 'CE',
                    btnType: 'op',
                    pressFnc: pressFnc,
                    context: context,
                  ),
                  buildButton(
                    btnValue: '=',
                    btnType: 'op',
                    pressFnc: pressFnc,
                    context: context,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  buildButton(
                    btnValue: '7',
                    pressFnc: pressFnc,
                    context: context,
                  ),
                  buildButton(
                    btnValue: '8',
                    pressFnc: pressFnc,
                    context: context,
                  ),
                  buildButton(
                    btnValue: '9',
                    pressFnc: pressFnc,
                    context: context,
                  ),
                  buildButton(
                    btnValue: '÷',
                    btnType: 'op',
                    pressFnc: pressFnc,
                    context: context,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  buildButton(
                    btnValue: '4',
                    pressFnc: pressFnc,
                    context: context,
                  ),
                  buildButton(
                    btnValue: '5',
                    pressFnc: pressFnc,
                    context: context,
                  ),
                  buildButton(
                    btnValue: '6',
                    pressFnc: pressFnc,
                    context: context,
                  ),
                  buildButton(
                    btnValue: '×',
                    btnType: 'op',
                    pressFnc: pressFnc,
                    context: context,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  buildButton(
                    btnValue: '1',
                    pressFnc: pressFnc,
                    context: context,
                  ),
                  buildButton(
                    btnValue: '2',
                    pressFnc: pressFnc,
                    context: context,
                  ),
                  buildButton(
                    btnValue: '3',
                    pressFnc: pressFnc,
                    context: context,
                  ),
                  buildButton(
                    btnValue: '-',
                    btnType: 'op',
                    pressFnc: pressFnc,
                    context: context,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  IntrinsicWidth(
                    child: buildButton(
                      btnValue: '0',
                      pressFnc: pressFnc,
                      context: context,
                      width: MediaQuery.of(context).size.width * 0.47,
                    ),
                  ),
                  buildButton(
                    btnValue: '.',
                    pressFnc: pressFnc,
                    context: context,
                  ),
                  buildButton(
                    btnValue: '+',
                    btnType: 'op',
                    pressFnc: pressFnc,
                    context: context,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildButton({
  required String btnValue,
  String btnType = 'num',
  required Function pressFnc,
  double width = 85.0,
  double fontSize = 30.0,
  required BuildContext context,
}) {
  return Expanded(
    child: Container(
      height: 80,
      width: width,
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.all(5.0),
      child: ElevatedButton(
        onPressed: () => pressFnc(btnValue),
        style: ElevatedButton.styleFrom(
          primary: btnType == 'num'
              ? AppTheme.numbersDarkColor
              : AppTheme.operationsColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Text(
          btnValue,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
