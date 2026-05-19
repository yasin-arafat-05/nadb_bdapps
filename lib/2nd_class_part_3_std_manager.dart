// ignore_for_file: avoid_print
//
// -> remove
// -> break from loop
//
// Assignment 1 + 2:
//
// Assignment1 Github link:
// https://github.com/yasin-arafat-05/nadb_bdapps/blob/main/lib/1_assignment.dart
//
//

import "dart:io";

void main() {
  final List<Map<String, dynamic>> students = [];
  while (true) {
    print('---------Choose any option from below------------');
    print(
      "1. ADD Student \n2. Show All Student \n3. Remove A Student \n4. Break",
    );
    stdout.write("choice: ");
    final choice = stdin.readLineSync();
    if (choice == '1') {
      addStudents(students);
    } else if (choice == '3') {
      stdout.write('Give an std id: ');
      String id = stdin.readLineSync() ?? '-1';
      removeStd(students, id);
    } else if (choice == '2') {
      print("-----------------------------------------------");
      print("-----------List of all students----------------");
      for (var item in students) {
        String name = item["Name"] ?? "";
        int marks = item["Marks"] ?? 0;
        int id = item["ID"] ?? 0;
        print("ID: $id Name: $name Marks: $marks");
      }
    } else if (choice == '4') {
      print("Get out from the loop");
      break;
    }
  }
}

void addStudents(List<Map<String, dynamic>> students) {
  // print automatically go to next line but stdout doesnot.
  stdout.write('Name: ');
  final name = stdin.readLineSync();
  stdout.write('Marks: ');
  // ! -> make sure we will not get anything null.
  final marks = int.parse(stdin.readLineSync()!);
  stdout.write('Give an unique id of the stdent: ');
  final id = int.parse(stdin.readLineSync()!);
  students.add({'ID': id, 'Name': name, 'Marks': marks});
}

void removeStd(List<Map<String, dynamic>> students, String stdId) {
  int id = int.tryParse(stdId) ?? 0;
  bool found = students.any((std) => std["ID"] == id);
  if (found) {
    students.removeWhere((student) => student["ID"].toString() == stdId);
    print("Stduent remove with $id");
  } else {
    print("No student found at $id");
  }
}

/*
---------Choose any option from below------------
1. ADD Student 
2. Show All Student 
3. Remove A Student 
4. Break
choice: 1
Name: Yasin
Marks: 34
Give an unique id of the stdent: 1
---------Choose any option from below------------
1. ADD Student 
2. Show All Student 
3. Remove A Student 
4. Break
choice: 1
Name: Arafat
Marks: 34
Give an unique id of the stdent: 2
---------Choose any option from below------------
1. ADD Student 
2. Show All Student 
3. Remove A Student 
4. Break
choice: 2
-----------------------------------------------
-----------List of all students----------------
ID: 1 Name: Yasin Marks: 34
ID: 2 Name: Arafat Marks: 34
---------Choose any option from below------------
1. ADD Student 
2. Show All Student 
3. Remove A Student 
4. Break
choice: 3
Give an std id: 1234
No student found at 1234
---------Choose any option from below------------
1. ADD Student 
2. Show All Student 
3. Remove A Student 
4. Break
choice: 3
Give an std id: 2
Stduent remove with 2
---------Choose any option from below------------
1. ADD Student 
2. Show All Student 
3. Remove A Student 
4. Break
choice: 2
-----------------------------------------------
-----------List of all students----------------
ID: 1 Name: Yasin Marks: 34
---------Choose any option from below------------
1. ADD Student 
2. Show All Student 
3. Remove A Student 
4. Break
choice: 4
Get out from the loop
*/
