import "dart:io"
int main(){
  stdout.write("Enter the income list");
  String? income = stdin.readLineSync();
  stdout.write("Enter the expense list");
  String? expense = stdin.readLineSync();
  
  return 0;
}