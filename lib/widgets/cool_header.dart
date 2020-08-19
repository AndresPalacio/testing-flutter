import 'package:flutter/material.dart';

class CoolHeader extends StatefulWidget {
  final String text;
  final double offset;
  const CoolHeader({Key key, this.text, this.offset}) : super(key: key);

  @override
  _CoolHeaderState createState() => _CoolHeaderState();
}

class _CoolHeaderState extends State<CoolHeader> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 40, top: 50, right: 20),
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: new LinearGradient(
              colors: [Colors.blue[300], Colors.blue[200]],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 45 - widget.offset / 2,
                    left: 40,
                    child: Text(
                      "${widget.text}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Baloo',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(), // I dont know why it can't work without container
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
