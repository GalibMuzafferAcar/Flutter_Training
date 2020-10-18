import 'package:flutter/material.dart';
import 'package:flutterapp/ui/anasayfa.dart';

class AramaSayfasi extends StatefulWidget {
  AramaSayfasi(Key k) : super(key: k);

  @override
  _AramaSayfasiState createState() => _AramaSayfasiState();
}

class _AramaSayfasiState extends State<AramaSayfasi> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 50,
        itemExtent: 300,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(10),
            child: Material(
                elevation: 20,
                borderRadius: BorderRadius.circular(10),
                color: index % 2 == 0 ? Colors.orangeAccent : Colors.indigo,
                child: Center(
                  child: Text(index.toString()),
                )),
          );
        });
  }
}
