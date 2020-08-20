import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_test_unit/model/poliza.dart';
import 'package:project_test_unit/widgets/cool_header.dart';
import 'package:project_test_unit/style/theme.dart' as Style;

class RentCalculator extends StatefulWidget {
  @override
  _RentCalculatorState createState() => _RentCalculatorState();
}

class _RentCalculatorState extends State<RentCalculator> {
  double offset = 0;
  final carSelected = TextEditingController();
  var _total = 0;
  String selected = "none";
  int selectedCar;
  int selectedPoliza;

  final carItems = <Poliza>[
    Poliza(
        title: "Todo riesgo",
        img: 'assets/icons/car-first.png',
        popular: true,
        price: 25),
    Poliza(
        title: "Terceros",
        img: 'assets/icons/car-second.png',
        popular: false,
        price: 16),
    Poliza(
        title: "Terceros ampliado",
        img: 'assets/icons/car-third.png',
        popular: false,
        price: 20)
  ];
  final precioCon = TextEditingController();
  final daysCon = TextEditingController();
  Map<String, dynamic> arrayPrice = {
    'Todo riesgo': 100000,
    'Terceros': 120000,
    'Terceros ampliado': 200000
  };
  Map<String, dynamic> arrayCar = {
    'Deportivo': 1000000,
    'Moto': 120000,
    'Urbano': 200000,
    'Camioneta': 1000000,
    'Clasico': 1000000
  };

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
              child: TextField(
                controller: daysCon,
                decoration: InputDecoration(hintText: "Ingrese numero de dias"),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Tipo de vehiculo",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Alata',
                      color: Style.Colors.titleColor,
                    ),
                  ),
                  DropDownField(
                    controller: carSelected,
                    hintText: "Seleccione el tipo de vehiculo",
                    enabled: true,
                    items: carTypeList,
                    itemsVisibleInDropdown: 2,
                    onValueChanged: (value) {
                      selectedCar = arrayCar['$value'];
                    },
                  )
                ],
              ),
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
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: carItems.map<Widget>((Poliza poliza) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = poliza.title;
                            selectedPoliza = arrayPrice[poliza.title];
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10.0, top: 10.0, bottom: 30, right: 10.0),
                          child: Container(
                            width: 170,
                            decoration: BoxDecoration(
                                color: (selected == poliza.title)
                                    ? Colors.grey[100]
                                    : Colors.white,
                                border: Border.all(
                                    color: Colors.grey[300], width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    height: 180.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                    ),
                                    child: Image.asset(poliza.img)),
                                Padding(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: Center(
                                      child: Text(
                                        poliza.title,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontFamily: 'Baloo'),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ));
                  }).toList()),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: new MaterialButton(
                  color: Colors.blue[200],
                  onPressed: () async {
                    int dias = int.parse(daysCon.text);
                    setState(() {
                     _total = calculateRent(dias, selectedCar, selectedPoliza);                      
                    });
                  },
                  child: new Text("Calcular")),
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

  List<String> carTypeList = [
    "Deportivo",
    "Moto",
    "Urbano",
    "Camioneta",
    "Clasico"
  ];

  int calculateRent(int days, int carPrice, int polizaPrice){
      return (carPrice*days)+polizaPrice;
  }
}
