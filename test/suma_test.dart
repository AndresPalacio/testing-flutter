import 'package:flutter_test/flutter_test.dart';
import 'package:project_test_unit/model/suma.dart' as addTwoNumbers;


main(){

 /// Arrage 
 const a = 2;
 const b = 3; 



/// act 
  int result = addTwoNumbers.addTwoNumbers(a, b);
  
/// assert
/// 

expect(5, equals(5));


}