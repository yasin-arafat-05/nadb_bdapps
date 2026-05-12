// ignore_for_file: avoid_print
/*
- compile time: convert high level language into binary files.
- run time: from those binary run the program.
- null safety in dart: we can directly assign null value in variable. to assign 
a null value we need to give ?, like String? name;
- Nullable?, ??, 

*/
int main() {
  final name = ['arafat'];
  const n = ['yasin'];

  try {
    n.add("arafat");
  } catch (e) {
    print("can't insert value in constant");
  }

  try {
    name.add("arafat");
  } catch (e) {
    print("can't insert value in $name");
  }
  print('$name');
  print('$n');

  // =========== 2: ===========

  // =========== 3:Map =========
  // is dynmic nullable
  final Map<String, dynamic> students = {
    'name': 12,
    'score': 88,
    "is dynamic nullable": null,
  };
  print('$students');
  students.addAll({"addAll": 2});
  print('$students');

  // =========== 4:list of map =========
  final List<Map<String, dynamic>> student = [
    {'name': 'yasin', 'score': 80},
    {'name': 'arafat', 'score': 20},
    {'name': 'nilla', 'score': null},
    {'name': 'zorina', 'score': null},
  ];

  // function
  String getGrade(int score) {
    return switch (score) {
      >= 80 => "A",
      >= 70 => "B",
      >= 60 => "C",
      >= 50 => "D",
      _ => "F",
    };
  }
  
  for (var std in student) {
    // ?? also accept null value
    int score = std['score'] ?? 0;
    String name = std['name'];
    print("name: $name and score: ${getGrade(score)}");
  }

  return 0;
}
