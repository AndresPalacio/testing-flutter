import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_test_unit/screens/calculator_screen.dart';

main() {
  testWidgets("Prueba calculatorPage", (WidgetTester test) async {
    final MaterialApp app = MaterialApp(
      home: Scaffold(body: CalculatorScreen()),
    );
    await test.pumpWidget(app);
    final datainput = find.byKey(Key('datapicker'));
    await test.tap(datainput);
    await test.pump(new Duration(milliseconds: 50));
    await test.pump();
    await test.tap(find.text('15'));
    await test.pump();
    await test.tap(find.text('24'));
    await test.pump();
    await test.longPress(find.text('OK'));
    await test.pump();
  

    expect(find.text('09/15/2020-09/24/2020'), findsOneWidget);
    var dropdown = find.byKey(Key('DropdownPrincipal'));

    await test.tap(dropdown);
    await test.pump(new Duration(milliseconds: 50));

    await test.longPress(find.text("").at(1));
    // puedo encontrar error de  Bad state: Too many elements, para eso puedo selleccionarr el elemento que necesito.
    await test.pump();
    final result = dropdown.evaluate().single.widget as DropdownButton;
    expect(result.value, equals('2000'));

    await test.tap(find.text("Todo riesgo"));
    await test.pump(new Duration(milliseconds: 50));
    await test.tap(find.text("Calcular"));
    await test.pump();
    final resultF = find.byKey(Key('test'));
    final data = resultF.evaluate().single.widget as Text;
    expect(data.data,equals("\$902000"));
  });
}
