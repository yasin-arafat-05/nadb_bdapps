// ignore_for_file: avoid_print
//
// List -> Dart's most-used collection -> add, remove,sort, filter,map .
// Set
// Difference between where,map!
//
int main() {
  // ============= List ===============
  final List<String> students = ["Karin", "Yasin", "rahim"];
  students.add("FOO");
  students.remove("Yasin");
  students.sort();

  print(students.length);

  // =========== Map ==================
  final Map<String, dynamic> scores = {"name": "Yasin", "score": 90};
  scores.addAll({"name": "Arafat", "score": 90});
  print(scores);

  // ============ For Each Loop ========
  scores.forEach((key, value) {
    print("$key:  $value");
  });

  // =========== Set ===============
  final Set<int> ids = {101, 102, 103, 103, 104};
  print('no duplicate will be print $ids');

  // ======== Funcation List Methods =====================
  // Iterable vs list:
  // Generic type
  final List<Map<String, dynamic>> studentslist = [
    {'Name': 'Yasin', 'score': 90},
    {'Name': 'Arafat', 'score': 40},
    {'Name': 'Rahim', 'score': 30},
    {'Name': 'Karim', 'score': 20},
  ];

  final passsed = studentslist.where((s) => (s['score'] as int) > 20);
  print(passsed);

  // ========== map: ============
  // where e is called generic
  final revisedScore = studentslist.map((e) {
    return e["score"] + 10;
  });
  print(revisedScore);

  final hasYasin = studentslist.any(
    (s) => (s["Name"] as String).startsWith('Y'),
  );
  print("$hasYasin");

  return 0;
}
