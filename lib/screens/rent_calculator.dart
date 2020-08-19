import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_test_unit/widgets/cool_header.dart';
import 'package:project_test_unit/widgets/poliza_list.dart';
import 'package:project_test_unit/style/theme.dart' as Style;
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class RentCalculator extends StatefulWidget {
  @override
  _RentCalculatorState createState() => _RentCalculatorState();
}

class _RentCalculatorState extends State<RentCalculator> {
  double offset = 0;
  var _precio;
  var _dias;
  var _tipoVehiculo;
  var tipoVehiculo = "Tipo vehiculos";
  var _total = 0;
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
            CoolHeader(
              text: "Calculadora de precios",
              offset: offset,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: new MaterialButton(
                  color: Colors.blue[200],
                  onPressed: () async {
                    SfDateRangePicker(
                      onSelectionChanged: _onSelectionChanged,
                      selectionMode: DateRangePickerSelectionMode.range,
                    );
                  },
                  child: new Text("Seleecionar fecha de alquiler")),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                "Póliza de seguro",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Style.Colors.titleColor,
                    fontFamily: 'Alata'),
              ),
            ),
            Container(
              height: 275,
              child: PolizaList(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                "Total",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Style.Colors.titleColor,
                    fontFamily: 'Alata'),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 30.0),
                child: Text("\$$_total",
                    style: TextStyle(fontFamily: 'Alata', fontSize: 16))),
          ],
        ),
      ),
    );
  }

  calculate_rent(int dias, int precio) {
    final poliza = 150000;
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    // TODO: implement your code here
  }
}
