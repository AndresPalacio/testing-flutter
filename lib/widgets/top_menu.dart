import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_test_unit/model/menu.dart';

class HomeHeader extends StatelessWidget {
  final menuItems = <Menu>[
    Menu(
      title: "Deportivo",
      img: 'assets/icons/car2.svg',
    ),
    Menu(
      title: "Moto",
      img: 'assets/icons/moto.svg',
    ),
    Menu(
      title: "Urbano",
      img: 'assets/icons/car3.svg',
    ),
    Menu(
      title: "Camioneta",
      img: 'assets/icons/car4.svg',
    ),
    Menu(
      title: "Clasico",
      img: 'assets/icons/car5.svg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.horizontal,
        children: menuItems.map<Widget>((Menu menu) {
          return GestureDetector(
            onTap: () {

            },
            child:  Padding(
            padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
            child: Container(
              width: 90,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey[300], width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: SvgPicture.asset(
                      menu.img,
                      colorBlendMode: BlendMode.darken,
                      placeholderBuilder: (BuildContext context) =>
                          new Container(
                              padding: const EdgeInsets.all(30.0),
                              child: const CircularProgressIndicator()),
                              key: Key(menu.img),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    menu.title,
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 11.0
                    ),
                    key: Key(menu.title),
                  )
                ],
              ),
            ),
          )
          );
        }).toList());
  }
}