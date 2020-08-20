import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_test_unit/widgets/top_menu.dart';


main() {
    final MaterialApp app = MaterialApp(
    home: Scaffold(
        body: HomeHeader()
    ),
  );


  testWidgets("Prueba Interfaz Principal", (WidgetTester test) async{
            await test.pumpWidget(app);
            expect(find.byType(Text), findsNWidgets(5));
  });
}