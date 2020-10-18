import 'package:flutter/material.dart';

import 'ResimVeButonTurleri.dart';

void uzunMethod() {
  debugPrint("Uzun içerikli method");
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange, accentColor: Colors.blue),
      home: new Scaffold(
          appBar: AppBar(
            title: Text(
              "Flutter Dersleri",
              style: TextStyle(fontSize: 24.0, color: Colors.white),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              debugPrint("FAB tıklandı");
            },
            backgroundColor: Colors.grey,
            child: Icon(
              Icons.all_inclusive,
              color: Colors.pink,
            ),
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat,
          body: ResimVeButonTurleri()
      ),
    );
  }
}