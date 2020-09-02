import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:project_test_unit/style/theme.dart' as Style;
import 'package:project_test_unit/widgets/car_list.dart';
import 'package:project_test_unit/widgets/top_car.dart';
import 'package:project_test_unit/widgets/top_menu.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Renta Vehiculos",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'Alata',
                      color: Style.Colors.titleColor,
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 1.0, top: 3.5),
                        child: Icon(
                          EvaIcons.bellOutline,
                          size: 25.0,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          height: 15.0,
                          width: 15.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Style.Colors.mainColor,
                            border: Border.all(width: 1.0, color: Colors.white),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 1.0, bottom: 1.0),
                                child: Text(
                                  "2",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 7.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 140,
              child: HomeHeader(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                "Autos Populares",
                style:
                    TextStyle(fontSize: 20.0, color: Style.Colors.titleColor),
              ),
            ),
            Container(
              height: 275,
              child: CarList(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                "Top Car ",
                style:
                    TextStyle(fontSize: 20.0, color: Style.Colors.titleColor),
              ),
            ),
            TopCar()
          ],
        ),
      ),
    );
  }
}
