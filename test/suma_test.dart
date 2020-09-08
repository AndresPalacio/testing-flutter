import 'package:flutter_test/flutter_test.dart';
import 'package:project_test_unit/model/suma.dart' as addTwoNumbers;


main() {
  
  test("Prueba de suma", (){

    // Arragen

    const a = 2;
    const b = 3;

    // Act 

    int result = addTwoNumbers.addTwoNumbers(a, b);

    // Assert
    expect(result==5, isTrue);


  });


}