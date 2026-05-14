//
// -> remove
// -> break from loop
//
//
import "dart:io";

void main() {
  final List<Map<String, dynamic>> students = [];
  final choice = stdin.readLineSync();
  while (true) {
    // ignore: avoid_print
    print("1 for ADD, 2 for Show, 3 for Remove");
    if (choice == '1') {
      addStudents(students);
    }
  }
}

void addStudents(List<Map<String, dynamic>> students) {
  stdout.write('Name: ');
  final name = stdin.readLineSync();
  stdout.write('Marks: ');

  // ! -> make sure we will not get anything.
  final marks = int.parse(stdin.readLineSync()!);
}
