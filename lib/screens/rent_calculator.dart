import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_test_unit/widgets/my_header.dart';

class RentCalculator extends StatefulWidget {
  @override
  _RentCalculatorState createState() => _RentCalculatorState();
}

class _RentCalculatorState extends State<RentCalculator> {
  double offset = 0;
  var _precio;
  var _dias;
  var _tipoVehiculo;
  var tipoVehiculo= "Tipo vehiculos";
  var _total;
  final List<String> _vehiculosData = <String>[
    "Name1",
    "Name2",
    "Name3",
    "Name4",
    "Name5",
    "Name6",
    "Name7",
    "Name8"
  ];
  final precioCon = TextEditingController();
  final diasCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyHeader(
              text: "Calculadora de precios",
              offset: offset,
            ),
            TextField(
              controller: diasCon,
              decoration: InputDecoration(hintText: "Ingrese dias de prestamo"),
            ),
            TextField(
              controller: precioCon,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Ingrese valor de alquiler por hora"),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _dias = diasCon.text;
                  _precio = precioCon.text;
                });
              },
              child: Text("Submit"),
            ),
            Text("Total $_total"),
          ],
        ),
      ),
    );
  }

  calculate_rent(int dias, int precio) {
    final poliza = 150000;
  }
}
