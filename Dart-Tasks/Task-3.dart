import 'dart:async';
import 'dart:io';

class Calculator {
  double add(double a, double b) {
    return a + b;
  }

  double subtract(double a, double b) {
    return a - b;
  }

  double multiply(double a, double b) {
    return a * b;
  }

  double divide(double a, double b) {
    if (b == 0) {
      throw Exception('Error: Division by zero');
    }
    return a / b;
  }
}

void main() async {
  Calculator calc = Calculator();

  stdout.write('Enter the first number: ');
  double firstNumber = double.parse(stdin.readLineSync()!);

  stdout.write('Enter the second number: ');
  double secondNumber = double.parse(stdin.readLineSync()!);

  stdout.write('Choose operation (+, -, *, /): ');
  String operation = stdin.readLineSync()!;

  double result;
  try {
    switch (operation) {
      case '+':
        result = calc.add(firstNumber, secondNumber);
        break;
      case '-':
        result = calc.subtract(firstNumber, secondNumber);
        break;
      case '*':
        result = calc.multiply(firstNumber, secondNumber);
        break;
      case '/':
        result = calc.divide(firstNumber, secondNumber);
        break;
      default:
        print('Invalid operation');
        return;
    }
    await Future.delayed(Duration(seconds: 5));
    print('Result: $result');
  } catch (e) {
    print(e);
  }
}
