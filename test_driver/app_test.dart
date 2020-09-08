import 'package:test/test.dart';
import 'package:flutter_driver/flutter_driver.dart';

void main() {
  group("Flutter test main app", () {
    SerializableFinder elemento = find.text("Autos Populares");
    SerializableFinder menuAlquiler = find.text("Calcular Alquiler");
    SerializableFinder datainput = find.byValueKey("datapicker");
    SerializableFinder dataInputNumber1 = find.text("15");
    SerializableFinder dataInputNumber2 = find.text("24");
    SerializableFinder dataInputOK = find.text("OK");

    SerializableFinder dropdown = find.byValueKey("DropdownPrincipal");

    SerializableFinder dropdownElement = find.text("Automatico");
    SerializableFinder selectElement = find.text("Todo riesgo");
    SerializableFinder boton = find.text("Calcular");

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    test(
      "Navegar a la pagina calcular alquiler",
      () async {
        await driver.runUnsynchronized(() async {
          await driver.waitFor(elemento);
          await driver.clearTimeline();
          await driver.tap(menuAlquiler);
          await driver.tap(datainput);
          await driver.tap(dataInputNumber1);
          await driver.tap(dataInputNumber2);
          await driver.tap(dataInputOK);
          await driver.tap(dropdown);
          await driver.tap(dropdownElement);
          await driver.tap(selectElement);
          await driver.tap(boton);

          SerializableFinder resultado = find.text("\$118000");
          expect(await driver.getText(resultado),"\$118000");
        },
        timeout: Duration(minutes: 1),
        );
      },
    );
  });
}