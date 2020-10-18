import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            "Ubuntu Bold",
            style: TextStyle(
                fontFamily: 'ubuntu',
                fontSize: 30,
                fontWeight: FontWeight.w700),
          ),
          Text(
            "Ubuntu Regular",
            style: TextStyle(
              fontFamily: 'ubuntu',
              fontSize: 30,
            ),
          ),
          Text(
            "PlayfairDisplay-VariableFont",
            style: TextStyle(
              fontFamily: 'cool',
              fontSize: 25,
            ),
          ),
          Text(
            "Default",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Text(
            "Default-Bold",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}
