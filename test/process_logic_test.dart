import 'package:flutter_test/flutter_test.dart';
import 'package:project_test_unit/bloc/logic.dart';


main(){

  group("Grupo de pruebas process logic",(){

    ProcessesLogic process;

    setUpAll((){

      process = new ProcessesLogic();

    });


   test("Prueba de calcular renta", (){

     // Act

     int result = process.calculateRent(4, 2000, 120000);


    // Asssert

    expect(result, 128000);



   });

   test("Calcular palindromo correcto", (){


      // Act

      bool result = process.calculatePalindromo(292);
      expect(result, true);


   });

  
  test("Calcular Palindromo incorrecto",(){

    // Act
    bool result = process.calculatePalindromo(153);
    
    // Assert

    expect(result, false);


  });


    test("Generar excepcion", (){

      expect(()=> process.calculatePalindromo(1), throwsA(predicate((e)=> e is ArgumentError && e.message == 'This is a test exception')));

    });
  



  });




}