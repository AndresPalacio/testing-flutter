import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:project_test_unit/bloc/logic.dart';
import 'package:project_test_unit/model/car.dart';
import 'package:project_test_unit/style/theme.dart' as Style;

class TopCar extends StatelessWidget {
  final carItems = <Car>[
    Car(
        title: "Clasico",
        price: 2500,
        img: 'assets/icons/car/carimage.jpg',
        rating: 5.0),
    Car(
        title: "Automatico",
        price: 2000,
        img: 'assets/icons/car/carimage2.jpg',
        rating: 3.2),
    Car(
        title: "Deportivo",
        price: 1300,
        img: 'assets/icons/car/carimage3.jpg',
        rating: 3.5)
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: carItems.length * 100.0,
      child: ListView(
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          children: ProcessesLogic().orden(carItems).map<Widget>((Car car) {
            return Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey[300], width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          image: DecorationImage(
                              image: AssetImage(car.img), fit: BoxFit.cover)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10.0),
                          width: MediaQuery.of(context).size.width - 180,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                car.title,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14.0),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        car.rating.toString(),
                                        style: TextStyle(
                                            fontSize: 9.0,
                                            color: Colors.black38),
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Icon(
                                        EvaIcons.star,
                                        color: Style.Colors.mainColor,
                                        size: 8.0,
                                      ),
                                      Icon(
                                        EvaIcons.star,
                                        color: Style.Colors.mainColor,
                                        size: 8.0,
                                      ),
                                      Icon(
                                        EvaIcons.star,
                                        color: Style.Colors.mainColor,
                                        size: 8.0,
                                      ),
                                      Icon(
                                        EvaIcons.star,
                                        color: Style.Colors.mainColor,
                                        size: 8.0,
                                      ),
                                      Icon(
                                        EvaIcons.star,
                                        color: Colors.black38,
                                        size: 8.0,
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        "(200)",
                                        style: TextStyle(
                                            fontSize: 9.0,
                                            color: Colors.black38),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "\$" + car.price.toString(),
                              style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }).toList()),
    );
  }
}
