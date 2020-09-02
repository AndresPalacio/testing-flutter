import 'package:flutter/material.dart';
import 'package:project_test_unit/bloc/logic.dart';
import 'package:project_test_unit/model/car.dart';
import 'package:project_test_unit/model/poliza.dart';
import 'package:project_test_unit/style/theme.dart' as Style;
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:intl/intl.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenTwoState createState() => _CalculatorScreenTwoState();
}

class _CalculatorScreenTwoState extends State<CalculatorScreen> {
  var _total = 0;
  String _opcionSeleccionada = '25';
  int selectedIndex = -1;
  String typePolicy = 'Clasico';
  int difference = 0;
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 7));

  final carItems = <Poliza>[
    Poliza(
        title: "Todo riesgo",
        img: 'assets/icons/car-first.png',
        popular: true,
        price: 100000),
    Poliza(
        title: "Terceros",
        img: 'assets/icons/car-second.png',
        popular: false,
        price: 120000),
    Poliza(
        title: "Terceros \nampliado",
        img: 'assets/icons/car-third.png',
        popular: false,
        price: 200000)
  ];

  final carItemsTip = <Car>[
    Car(
        title: "Clasico",
        price: 25,
        img: 'assets/icons/car/carimage.jpg',
        rating: 4.2),
    Car(
        title: "Automatico",
        price: 2000,
        img: 'assets/icons/car/carimage2.jpg',
        rating: 4.2),
    Car(
        title: "Deportivo",
        price: 1300,
        img: 'assets/icons/car/carimage3.jpg',
        rating: 4.7)
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 35.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: RichText(
                        softWrap: true,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Calculadora",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 25,
                              ),
                            ),
                            TextSpan(
                              text: "\nAlquiler",
                              style: TextStyle(
                                fontSize: 25.0,
                                fontFamily: 'Alata',
                                color: Style.Colors.titleColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Divider(),
                Text(
                  'Tipo de vehiculo',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Alata',
                    color: Style.Colors.titleColor,
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Color(0xFFE5E5E5),
                      ),
                    ),
                    child: _crearDropdown()),
                Text(
                  'Tipo de poliza',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Alata',
                    color: Style.Colors.titleColor,
                  ),
                ),
                Container(
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: carItems.length,
                    itemBuilder: (BuildContext context, int position) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = position;
                            typePolicy = carItems[position].title;
                          });
                        },
                        child: Container(
                            margin: EdgeInsets.all(0.5),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                (selectedIndex == position)
                                    ? BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 20,
                                        color:
                                            Color(0xFF000000).withOpacity(.40),
                                      )
                                    : BoxShadow(
                                        offset: Offset(0, 3),
                                        blurRadius: 6,
                                        color:
                                            Color(0xFFB7B7B7).withOpacity(.16),
                                      ),
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  carItems[position].img,
                                ),
                                Text(carItems[position].title,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            )),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                RaisedButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  key: Key('datapicker'),
                  elevation: 4.0,
                  onPressed: () async {
                    await displayDateRangePicker(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.date_range,
                              size: 18.0,
                              color: Style.Colors.mainColor,
                            ),
                            Text(
                              "${DateFormat('MM/dd/yyyy').format(_startDate).toString()}-${DateFormat('MM/dd/yyyy').format(_endDate).toString()}",
                              style: TextStyle(
                                  color: Style.Colors.textMain,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                MaterialButton(
                    minWidth: double.infinity,
                    color: Style.Colors.mainColor,
                    onPressed: () async {
                      setState(() {
                        _total = ProcessesLogic().calculateRent(
                            difference,
                            carItems[selectedIndex].price,
                            int.parse(_opcionSeleccionada));
                      });
                    },
                    child: new Text("Calcular",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0))),
                SizedBox(
                  height: 25,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    title: Text(
                      "Total",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Style.Colors.titleColor,
                          fontFamily: 'Alata'),
                    ),
                    subtitle: Text("\$$_total",
                        key: Key("test"),
                        style: TextStyle(fontFamily: 'Alata', fontSize: 16)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }

  Future displayDateRangePicker(BuildContext context) async {
    final List<DateTime> picked = await DateRagePicker.showDatePicker(
        context: context,
        initialFirstDate: _startDate,
        initialLastDate: _endDate,
        firstDate: new DateTime(DateTime.now().year - 50),
        lastDate: new DateTime(DateTime.now().year + 50));
    if (picked != null && picked.length == 2) {
      setState(() {
        _startDate = picked[0];
        _endDate = picked[1];
        difference = picked[1].difference(picked[0]).inDays;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = new List();

    carItemsTip.forEach((car) {
      lista.add(DropdownMenuItem(
        child: Text(car.title),
        value: car.price.toString(),
      ));
    });

    return lista;
  }

  Widget _crearDropdown() {
    return Row(
      children: <Widget>[
        Expanded(
          child: DropdownButton(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Style.Colors.mainColor,
            ),
            isExpanded: true,
            underline: SizedBox(),
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(),
            onChanged: (opt) {
              setState(() {
                _opcionSeleccionada = opt;
              });
            },
            key: Key('DropdownPrincipal'),
          ),
        )
      ],
    );
  }
}
