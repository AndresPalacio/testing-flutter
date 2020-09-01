import 'dart:typed_data';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:project_test_unit/bloc/bottom_nav_bloc.dart';
import 'package:project_test_unit/screens/calculator_screen.dart';
import 'package:project_test_unit/style/theme.dart' as Style;

import 'home_screen.dart';

class MainScreen extends StatefulWidget {

  createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String barcode = '';
  Uint8List bytes = Uint8List(200);
  BottomNavBarBloc _bottomNavBarBloc;
  @override
  void initState() {
    super.initState();
    _bottomNavBarBloc = BottomNavBarBloc();
    barcode = '';
  }

  @override
  void dispose() {
    _bottomNavBarBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<NavBarItem>(
        stream: _bottomNavBarBloc.itemStream, 
        initialData: _bottomNavBarBloc.defaultItem,
        builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
          switch (snapshot.data) { 
            case NavBarItem.HOME:
              return HomeScreen();
            case NavBarItem.NEAR:
              return CalculatorScreen();
            case NavBarItem.CART:
              return _testScreen();
            case NavBarItem.ACCOUNT:
              return _testScreen();
          }
          return Container();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: StreamBuilder(
        stream: _bottomNavBarBloc.itemStream,
        initialData: _bottomNavBarBloc.defaultItem,
        builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
          return 
          BottomNavigationBar(
            selectedFontSize: 10.0,
            unselectedFontSize: 10.0,
          selectedItemColor: Style.Colors.mainColor,
          unselectedItemColor: Style.Colors.titleColor,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          iconSize: 25.0,
          currentIndex: snapshot.data.index, // indix de cada pestaña donde se encuentra
          onTap: _bottomNavBarBloc.pickItem, // aqui cambiamos el estado de la pantalla con el index de el elemento seleccionado, dando el 0 al home
          items: [
            BottomNavigationBarItem(
                title: Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text('Home', style: TextStyle(fontSize: 10))),
                icon: Icon(EvaIcons.homeOutline, color: Style.Colors.titleColor,),
                activeIcon: Icon(EvaIcons.home, color: Style.Colors.mainColor,),),
            BottomNavigationBarItem(
                title: Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text('Calcular Alquiler', style: TextStyle(fontSize: 10))),
                icon: Icon(EvaIcons.creditCardOutline, color: Style.Colors.titleColor,),
                activeIcon: Icon(EvaIcons.creditCard, color: Style.Colors.mainColor),),
            BottomNavigationBarItem(
                title: Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text('Tiempo de alquiler', style: TextStyle(fontSize: 10))),
                icon: Icon(EvaIcons.clockOutline, color: Style.Colors.titleColor,),
                activeIcon: Icon(EvaIcons.clock, color: Style.Colors.mainColor),
                ),
            BottomNavigationBarItem(
                title: Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text('Favourite', style: TextStyle(fontSize: 10))),
                icon: Icon(EvaIcons.bellOutline, color: Style.Colors.titleColor,),
                activeIcon: Icon(EvaIcons.bell, color: Style.Colors.mainColor),),
          ],
          );
        },
      ),
    );
  }


  Widget _testScreen() {
    return Center(
      child: Text(
        'Test Screen',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: Colors.blue,
          fontSize: 25.0,
        ),
      ),
    );
  }
}
