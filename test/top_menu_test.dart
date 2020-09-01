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
           final element2 = find.byKey(Key('assets/icons/car2.svg'));
           final image = element2.evaluate().single.widget as SvgPicture;

            // IMPORTANCIA DEL KEY

           expect((image.pictureProvider as ExactAssetPicture).assetName,equals("assets/icons/car2.svg"));
           expect(find.text("Deportivo"),findsOneWidget);
           expect(find.byType(ListView),findsOneWidget);
           expect(find.byType(Column),findsNWidgets(5));
           expect(find.byType(Text),findsNWidgets(5));

  });
}