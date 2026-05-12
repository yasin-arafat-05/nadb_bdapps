// ignore_for_file: avoid_print

int main() {
  final List<Map<dynamic, dynamic>> inexp = [
    {'income': 2000.2, 'expense': 100.0},
    {'income': 3000.4, 'expense': 200.2},
    {'income': 4000.12, 'expense': 400.1},
  ];

  for (var x in inexp) {
    double income = x['income'] as double;
    double expense = x['expense'] as double;
    print('difference : ${income - expense}');
  }

  // task assending and descending order vlaue:
  final List<Map<String, dynamic>> student = [
    {'name': 'yasin', 'score': 80},
    {'name': 'arafat', 'score': 20},
    {'name': 'nilla', 'score': 60},
    {'name': 'zorina', 'score': 30},
  ];

  // desding  order
  student.sort((a, b) => (b['score'] as int).compareTo(a['score'] as int));
  print(student);

  // assending  order
  student.sort((a, b) => (a['score'] as int).compareTo(b['score'] as int));
  print(student);

  // filter:
  print('============Iterable ouput=======================');
  final low = student.where((arr) => arr['score'] < 80);
  print(low);

  print('============Iterable to list=======================');
  final lower = student.where((arr) => arr['score'] < 80).toList();
  print('$lower');
  return 0;
}
