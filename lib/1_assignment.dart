// ignore_for_file: avoid_print

import "dart:io";
import "dart:math";

int main() {
  stdout.write("Enter the income list: \n");
  String income = stdin.readLineSync() ?? " ";
  stdout.write("Enter the expense list: \n");
  String expense = stdin.readLineSync() ?? " ";

  List<int> incomes = income.split(" ").map(int.parse).toList();
  List<int> expenses = expense.split(" ").map(int.parse).toList();

  int length = max(incomes.length, expenses.length);

  for (int i = 0; i <= length; i++) {
    int inc = incomes[i];
    int exp = expenses[i];
    print("income: $inc  expense: $exp difference: ${inc - exp}");
  }
  return 0;
}
