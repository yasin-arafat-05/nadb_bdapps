//
//
//
// ignore_for_file: avoid_print

int main() {
  final numbers = <String>["one", "two", "three", "four"];
  numbers.sort((a, b) => a.length.compareTo(b.length));
  print(numbers);

  final List<Map<String, dynamic>> studentslist = [
    {'Name': 'Yasin', 'score': 90},
    {'Name': 'Arafat', 'score': 40},
    {'Name': 'Rahim', 'score': 30},
    {'Name': 'Karim', 'score': 20},
  ];

  studentslist.sort((a, b) => (a['score'] as int).compareTo(b['score'] as int));
  print(studentslist);

  return 0;
}
