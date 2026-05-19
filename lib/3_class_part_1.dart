//
// OOP -> Object Oriented Programming.
//
enum Name { foo }

// mixin class
mixin Test{

}


abstract class Animal {
  final String name;
  
  // _private variable start with underscore
  final int _int;

  Animal({required this.name});
  void canWalk() {
    print("Walking. .");
  }
}




//
// Inheritance extends one class from another:
// parent class is call super class
//
class Person extends Animal {
  final String name;

  // default constructor of the calss:
  // Named Constructor;
  Person({required this.name});

  // factory constructor (JSON)

  // super class method:
  @override
  void canWalk() {
    print("Person can work");
  }

  // run method:
  void run() {}
}


// abstract class an object can't made:
class Cat extends Animal{
  @override
  void canWalk() {
    super.canWalk();
  }
}


void main() {
  // same vlaue but will takes two variable spaces;
  final String name = 'foo';
  final String surname = 'foo';

  // we can do the same thing with enum
  print(Name);
  print(Name.foo);
  print(Name.foo.name);

  // class also be like enum but has some additional propertics:
  final test = Person(name: 'Yasin');
  print(test.name);
  print(test.);
}
