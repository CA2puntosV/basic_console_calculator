import 'dart:io';

void main() {
  num? value1;
  num? value2;
  List<double> valueList = [];
  num result;

  print(
      'Select and option to do\n[0 Add] - [1 Subtract] - [2 Multiplication] - [3 Module] - [4 Factorial] - [5 Summation] - [6 Product]');
  int option = int.parse(stdin.readLineSync()!);

  if (option == 0 || option == 1 || option == 2 || option == 3) {
    print('Write your first value');
    value1 = num.parse(stdin.readLineSync()!);

    print('Write your second value');
    value2 = num.parse(stdin.readLineSync()!);
  }

  if (option == 4) {
    print('Write your value');
    value1 = num.parse(stdin.readLineSync()!);
  }

  if (option == 5 || option == 6) {
    print('Write your values for the list of values');
    for (var i = 0; i <= 2; i++) {
      value1 = num.parse(stdin.readLineSync()!);
      valueList.add(value1.toDouble());
    }
  }

  Operation ope = Operation.values[option];

  switch (ope) {
    case Operation.sum:
      result = value1! + value2!;
      print('$value1 + $value2 = $result');
      break;
    case Operation.rest:
      result = value1! - value2!;
      result < 0
          ? print('$value1 - $value2 = $result NEGATIVE')
          : print('$value1 - $value2 = $result ');
      break;
    case Operation.mult:
      result = value1! * value2!;
      print('$value1 * $value2 = $result');
      break;
    case Operation.mod:
      result = value1! % value2!;
      print('$value1 % $value2 = $result');
      break;
    case Operation.fac:
      int factorial = 1;
      for (var i = value1!; i >= 1; i--) {
        factorial *= i.toInt();
      }
      result = factorial;
      print('Factorial of $value1 is $result');
      break;
    case Operation.totalSum:
      double summation = 0;
      for (var i = 0; i <= valueList.length - 1; i++) {
        summation += valueList[i];
      }
      result = summation;
      print('Total Summation of the list values is $result');
      break;
    case Operation.totalProd:
      double product = 1;
      for (var i = 0; i <= valueList.length - 1; i++) {
        product *= valueList[i];
      }
      result = product;
      print('Total Product of the list values is $result');
      break;
    default:
      print('Invalid option, try again (:');
  }
}

enum Operation {
  sum, //Add
  rest, //Subtract
  mult, //Multiplication
  mod, //Module
  fac, //Factorial
  totalSum, //Summation
  totalProd, //Product
}
