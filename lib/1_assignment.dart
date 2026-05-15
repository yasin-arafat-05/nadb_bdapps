import "dart:io";

int main() {
  //
  // dynmic can automatically handle null safety.
  //
  final List<Map<dynamic, dynamic>> data = [];

  // ============ take input from cli: ===============
  stdout.write("Enter the total number of customers <1 to 9>: ");
  int num = int.parse(stdin.readLineSync()!);
  while (num != 0) {
    takeInput(data);
    num = num - 1;
  }

  int cnt = 1;

  for (var val in data) {
    String? name = val["Name"];
    double income = val["Income"] ?? -1;
    double food = val["Food"] ?? -1;
    double rent = val["Rent"] ?? -1;
    double trans = val['Trans'] ?? -1;

    if (food == -1) {
      print("Food Value is not entered correctly");
    }
    if (rent == -1) {
      print("Food Value is not entered correctly");
    }
    if (trans == -1) {
      print("Food Value is not entered correctly");
    }

    print("");
    print("============ Person No: $cnt =================");
    print("Person Name: $name");
    print("Income: $income");
    print("Food Expense: $food");
    print("Rent Expense: $rent");
    print("Transport Expense: $trans");
    print("----------------------------");
    print("Total Expense: ${food + rent + trans}");

    double dif = income - (food + rent + trans);
    if (dif < 0) {
      print("Tomar income theke expense beci.");
    } else {
      print("Saving: $dif");
    }

    cnt += 1;
  }
  return 0;
}

void takeInput(List<Map<dynamic, dynamic>> data) {
  // take input customer name
  stdout.write("Enter Name: ");
  String? name = stdin.readLineSync();

  // take input income expense
  stdout.write("Enter Income: ");
  String? incm = stdin.readLineSync();
  double? income = double.tryParse(incm ?? "");

  // take input food expense
  stdout.write("Enter Food Expense: ");
  String? fe = stdin.readLineSync();
  double? foodExpense = double.tryParse(fe ?? "");

  // take input rent expense
  stdout.write("Enter rent Expense: ");
  String? re = stdin.readLineSync();
  double? rentExpense = double.tryParse(re ?? "");

  // take input transport expense
  stdout.write("Enter rent Expense: ");
  String? te = stdin.readLineSync();
  double? transExpense = double.tryParse(te ?? "");

  data.add({
    "Name": name,
    "Income": income,
    "Food": foodExpense,
    "Rent": rentExpense,
    "Trans": transExpense,
  });
}

/*
================================ output of the code: ===========================
===============================copiedfrom termnal D:)===========================

Enter the total number of customers <1 to 9>: 2
Enter Name: Yasin
Enter Income: 12
Enter Food Expense: 12.0
Enter rent Expense: 12.0
Enter rent Expense: 12.0
Enter Name: Arafat
Enter Income: 500
Enter Food Expense: 12.0
Enter rent Expense: 5.0
Enter rent Expense: 5.0

============ Person No: 1 =================
Person Name: Yasin
Income: 12.0
Food Expense: 12.0
Rent Expense: 12.0
Transport Expense: 12.0
----------------------------
Total Expense: 36.0
Tomar income theke expense beci.

============ Person No: 2 =================
Person Name: Arafat
Income: 500.0
Food Expense: 12.0
Rent Expense: 5.0
Transport Expense: 5.0
----------------------------
Total Expense: 22.0
Saving: 478.0

*/
