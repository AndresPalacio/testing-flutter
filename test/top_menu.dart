import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_test_unit/widgets/top_menu.dart';

main() {
  
   final MaterialApp app = MaterialApp(
     home: Scaffold(
       body: HomeHeader() 
       ),

   );

  
  testWidgets("Prueba Widget top menu", (WidgetTester test) async{

     await test.pumpWidget(app);
     final imagenCar = find.byKey(Key('assets/icons/car2.svg'));
     final image = imagenCar.evaluate().single.widget as SvgPicture;

     expect((image.pictureProvider as ExactAssetImage).assetName, equals('assets/icons/car2.svg'));
     expect(find.text("Deportivo"), findsOneWidget);
     expect(find.byType(ListView),findsOneWidget);




  });



}