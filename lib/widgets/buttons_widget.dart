import 'package:flutter/material.dart';
import 'package:calculator/themes/app_theme.dart';

class ButtonsPadWidget extends StatelessWidget {
  final Function pressFnc;

  const ButtonsPadWidget({Key? key, required this.pressFnc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 5.0,
      ),
      child: Column(
        children: [
          Row(
            children: [
              buildButton(
                  btnValue: 'CE',
                  btnType: 'op',
                  pressFnc: pressFnc,
                  width: 180.0),
              buildButton(
                  btnValue: '=',
                  btnType: 'op',
                  pressFnc: pressFnc,
                  width: 180.0),
            ],
          ),
          Row(
            children: [
              buildButton(btnValue: '7', pressFnc: pressFnc),
              buildButton(btnValue: '8', pressFnc: pressFnc),
              buildButton(btnValue: '9', pressFnc: pressFnc),
              buildButton(btnValue: '÷', btnType: 'op', pressFnc: pressFnc),
            ],
          ),
          Row(
            children: [
              buildButton(btnValue: '4', pressFnc: pressFnc),
              buildButton(btnValue: '5', pressFnc: pressFnc),
              buildButton(btnValue: '6', pressFnc: pressFnc),
              buildButton(btnValue: '×', btnType: 'op', pressFnc: pressFnc),
            ],
          ),
          Row(
            children: [
              buildButton(btnValue: '1', pressFnc: pressFnc),
              buildButton(btnValue: '2', pressFnc: pressFnc),
              buildButton(btnValue: '3', pressFnc: pressFnc),
              buildButton(btnValue: '-', btnType: 'op', pressFnc: pressFnc),
            ],
          ),
          Row(
            children: [
              buildButton(btnValue: '0', pressFnc: pressFnc, width: 180.0),
              buildButton(btnValue: '.', pressFnc: pressFnc),
              buildButton(btnValue: '+', btnType: 'op', pressFnc: pressFnc),
            ],
          ),
        ],
      ),
      // child: IntrinsicHeight(
      //   child: Row(
      //     children: [
      //       Expanded(
      //         child: Column(
      //           children: [
      //             buildButton(
      //                 btnValue: 'CE', btnType: 'op', pressFnc: pressFnc),
      //             buildButton(btnValue: '7', pressFnc: pressFnc),
      //             buildButton(btnValue: '4', pressFnc: pressFnc),
      //             buildButton(btnValue: '1', pressFnc: pressFnc),
      //             buildButton(btnValue: '0', pressFnc: pressFnc),
      //           ],
      //         ),
      //       ),
      //       Expanded(
      //         child: Column(
      //           children: [
      //             Row(
      //               children: [
      //                 Expanded(
      //                   child: buildButton(
      //                     btnValue: '±',
      //                     btnType: 'op',
      //                     pressFnc: pressFnc,
      //                     width: 120.0,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //             buildButton(btnValue: '8', pressFnc: pressFnc),
      //             buildButton(btnValue: '5', pressFnc: pressFnc),
      //             buildButton(btnValue: '2', pressFnc: pressFnc),
      //             buildButton(btnValue: '.', pressFnc: pressFnc),
      //           ],
      //         ),
      //       ),
      //       Expanded(
      //         child: Column(
      //           children: [
      //             // buildButton(btnValue: '%', btnType: 'op', pressFnc: pressFnc),
      //             buildButton(btnValue: '9', pressFnc: pressFnc),
      //             buildButton(btnValue: '6', pressFnc: pressFnc),
      //             buildButton(btnValue: '3', pressFnc: pressFnc),
      //             buildButton(btnValue: '=', btnType: 'op', pressFnc: pressFnc),
      //           ],
      //         ),
      //       ),
      //       Expanded(
      //         child: Column(
      //           children: [
      //             buildButton(btnValue: '÷', btnType: 'op', pressFnc: pressFnc),
      //             buildButton(btnValue: '×', btnType: 'op', pressFnc: pressFnc),
      //             buildButton(btnValue: '-', btnType: 'op', pressFnc: pressFnc),
      //             Expanded(
      //               child: buildButton(
      //                   btnValue: '+', btnType: 'op', pressFnc: pressFnc),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

Widget buildButton({
  required String btnValue,
  String btnType = 'num',
  required Function pressFnc,
  double width = 85.0,
  double fontSize = 30.0,
}) {
  return Container(
    height: 82.0,
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
  );
}
