//
//
//
mixin CanRun {

  int get tierCount;

  void canMove(){
    if(tierCount<4){
      throw Exception('Cannot Move The Car');
    }else{
      print('Car moving ... ');
    }
  }
}


// implements --> inheretance of abstract class.
enum Car with CanRun implements Comparable<Car>{
  modelY(manufacturer: 'Tesla', model: 'Y', year: 2010),
  modelS(manufacturer: 'Tesla', model: 'S', year: 2012),
  modelX(manufacturer: 'Tesla', model: 'X', year: 2015),
  model3(manufacturer: 'Tesla', model: '3', year: 2017);

  final String manufacturer;
  final String model;
  final int year;
  final int tiers;

  // make a constuctor for enum:
  // must give value,
  const Car({
    required this.manufacturer,
    required this.model,
    required this.year,
    this.tiers=4
  });

  @override
  int get tierCount =>  tiers;

  @override
  toString() => "$manufacturer $model ($year)";

  @override 
  int compareTo((Car other)) => year.compareTo(other.year);
}

// extension canbe made for class and enum;
extension Fly on Car{
  void fly(){
    // this object of Car
    print('$this car can fly');
  }
}

void main() {
  try{
    
  }
}


