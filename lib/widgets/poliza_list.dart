import 'package:flutter/material.dart';
import 'package:project_test_unit/model/poliza.dart';

class PolizaList extends StatelessWidget {
  final foodItems = <Poliza>[
    Poliza(
        title: "Todo riesgo",
        img: 'assets/icons/foods/food5.jpg',
        popular: true,
        price: 25),
    Poliza(
        title: "Terceros",
        img: 'assets/icons/foods/food5.jpg',
        popular: false,
        price: 16),
    Poliza(
        title: "Terceros ampliado",
        img: 'assets/icons/foods/food5.jpg',
        popular: false,
        price: 20)
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.horizontal,
        children: foodItems.map<Widget>((Poliza poliza) {
          return GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(
                    left: 10.0, top: 10.0, bottom: 30, right: 10.0),
                child: Container(
                  width: 170,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey[300], width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
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
                          child: Image.asset('assets/icons/foods/food5.jpg')),
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
        }).toList());
  }
}
