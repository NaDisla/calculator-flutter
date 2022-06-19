class CalculatorLogic {
  String result = '';

  String calculate(String operator, String num1, String num2) {
    switch (operator) {
      case '+':
        result = (double.parse(num1) + double.parse(num2)).toString();
        break;
      case '-':
        result = (double.parse(num1) - double.parse(num2)).toString();
        break;
      case '×':
        result = (double.parse(num1) * double.parse(num2)).toString();
        break;
      case '÷':
        result = (double.parse(num1) / double.parse(num2)).toString();
        break;
    }
    return result;
  }
}
