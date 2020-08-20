
import 'package:flutter_test/flutter_test.dart';
import 'package:project_test_unit/bloc/logic.dart';

main() {
  group("grupo de pruebas", (){

  ProcessesLogic process;
  
  setUpAll((){
    process = new ProcessesLogic();
  });


  
  test("Test process", (){
    int result =  process.calculateRent(4, 120000, 120000);
    
    expect(result, 600000);
  });

});
}