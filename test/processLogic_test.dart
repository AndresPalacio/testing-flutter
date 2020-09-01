
import 'package:flutter_test/flutter_test.dart';
import 'package:project_test_unit/bloc/logic.dart';

main() {
  group("grupo de pruebas", (){

  ProcessesLogic process;
  
  setUpAll((){
    // Arrage
    process = new ProcessesLogic();
  });


  
  test("Prueba clase", (){
    // Act
    int result =  process.calculateRent(4, 120000, 120000);
    //Assert
    expect(result, 600000);
  });
  
  test("Calcular palindromo", (){
    bool result = process.calculatePalindromo(292);
    expect(result, true);
  });

  test("Calcular palindromo incorrecto", (){
    bool result = process.calculatePalindromo(153);
    expect(result, false);
  });

  test("Generar excepcion", (){
  expect(() => process.calculatePalindromo(1), 
    throwsA(predicate((e) => e is ArgumentError && e.message == 'This is a test exception')));
  });

});
}