import 'package:calculator/themes/app_theme.dart';
import 'package:calculator/widgets/calculator_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: AppTheme.backgroundDarkColor,
          body: CalculatorScreen(),
        ),
      ),
    );
  }
}
