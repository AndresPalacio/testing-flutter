import 'package:project_test_unit/model/car.dart';

class ProcessesLogic{


  int calculateRent(int days, int carPrice, int polizaPrice) {
    print(days);
    print(carPrice);
    print(polizaPrice);
    return (carPrice * days) + polizaPrice;
  }
  
  List<Car> orden(List<Car> listCar){
     listCar.sort((Car a, Car b)=>b.rating.compareTo(a.rating));
     listCar.take(3).toList();
    return listCar;
  }

  bool calculatePalindromo(int num){

    if(num<10){
      throw ArgumentError("This is a test exception");
    }

  int reservedInteger = 0;
  int remainder = 0;
  int originalInteger;
  
  originalInteger = num;
  
  while(num!=0){
    remainder = num % 10;
    reservedInteger = reservedInteger * 10 + remainder;
    num = (num/10).toInt();
   
    
  }
  if(originalInteger==reservedInteger){
    return true;
    
  }else{
    return false;
  }
  
}
 
}