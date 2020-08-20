import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_test_unit/screens/rent_calculator.dart';


main() {
  final MaterialApp app = MaterialApp(
    home: Scaffold(
        body: RentCalculator()
    ),
  );

  testWidgets("Prueba Interfaz Principal", (WidgetTester test) async{
      await test.pumpWidget(app);
      expect(find.byType(Column), findsNWidgets(6));
      //var fieldDropDownField = find.byKey(Key("dropDownField"));

      var fieldDias = find.widgetWithText(TextField,"Ingrese numero de dias");
      await test.enterText(fieldDias, "4");
      expect(find.text("4"), findsOneWidget);
      
      

      var fieldDropDownField = find.byIcon(Icons.arrow_drop_down);
      await test.tap(fieldDropDownField);
      await test.pumpAndSettle();
      expect(find.text("Moto"),findsOneWidget);
      await test.tap(find.text("Moto"));


      var elementList = find.text("Terceros");
      expect(elementList, findsOneWidget);



      var submit = find.text("Calcular");
      await test.tap(submit);
      await test.pump();
      expect(submit, findsOneWidget);

      var total = find.byKey(Key("test"));
      expect(total, findsOneWidget);

  });


}