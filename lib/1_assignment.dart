// ignore_for_file: avoid_print

import "dart:io";

void main() {
  // Income input
  stdout.write("Enter income: ");
  int income = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

  // Expense inputs
  stdout.write("Enter food expense: ");
  int food = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

  stdout.write("Enter rent expense: ");
  int rent = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

  stdout.write("Enter transport expense: ");
  int transport = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

  // Total expense
  int totalExpense = food + rent + transport;

  // Remaining balance
  int balance = income - totalExpense;

  // Savings percentage
  double savings = (balance / income) * 100;

  // Map for categories (Bonus)
  Map<String, int> expenses = {
    "Food": food,
    "Rent": rent,
    "Transport": transport,
  };

  // Output
  print("\n===== Finance Summary =====");
  print("Income: $income");

  print("\nExpenses:");
  expenses.forEach((key, value) {
    print("$key: $value");
  });

  print("\nTotal Expense: $totalExpense");
  print("Remaining Balance: $balance");
  print("Savings Percentage: ${savings.toStringAsFixed(2)}%");
}
