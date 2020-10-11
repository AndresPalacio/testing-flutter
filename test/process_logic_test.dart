


import 'package:flutter_test/flutter_test.dart';
import 'package:project_test_unit/bloc/logic.dart';


main(){
  group("Grupo de pruebas de process logic", (){

    ProcessesLogic process;

   setUpAll((){

     process = new ProcessesLogic();


   });


   test("Prueba calcular renta", (){

    int result = process.calculateRent(4, 2000, 120000);
    

    expect(result,128000);


   });

   test("Calcular palindromo",(){
      
      bool result = process.calculatePalindromo(292);

      expect(result,true);
      
   });


   test("Generar exepcion",(){
     
     expect(()=>process.calculatePalindromo(1),throwsA(predicate((e)=>e is ArgumentError && e.message == 'This is a test exception')));

   });


  });




}