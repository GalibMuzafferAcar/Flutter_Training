import 'dart:math' as math;
import 'package:flutter/material.dart';

class CollapsableToolBarOrnek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Sliver"),),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.red,
            expandedHeight: 100,
            floating: false,
            pinned: true,
            snap: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Custom Scrollview"),
              centerTitle: false,
              background: Image.network(
                "https://wallpaperset.com/w/full/2/5/9/172333.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverList(
              delegate: SliverChildListDelegate(sabitlisteelemanlari()),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                    _dinamikElemanUretenFonksiyon,
                    childCount: 6)),
          ),
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverFixedExtentList(
                delegate: SliverChildListDelegate(sabitlisteelemanlari()),
                itemExtent: 100),
          ),
          SliverGrid(
              delegate: SliverChildListDelegate(sabitlisteelemanlari()),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2)),
          SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(_dinamikElemanUretenFonksiyon,
                  childCount: 6),
              itemExtent: 50),
          SliverGrid(
              delegate: SliverChildBuilderDelegate(_dinamikElemanUretenFonksiyon,
                  childCount: 8),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4)),
          SliverGrid(
              delegate: SliverChildBuilderDelegate(_dinamikElemanUretenFonksiyon,
                  childCount: 9),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200)),
          SliverGrid.count(
            crossAxisCount: 6,
            children: sabitlisteelemanlari(),
          ),
          SliverGrid.extent(
            maxCrossAxisExtent: 300,
            children: sabitlisteelemanlari(),
          )
        ],
      ),
    );
  }

  List<Widget> sabitlisteelemanlari() {
    return [
      Container(
        height: 100,
        child: Text(
          "Sabit liste elemanı 1",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        color: Colors.amber,
        alignment: Alignment.center,
      ),
      Container(
        height: 100,
        child: Text(
          "Sabit liste elemanı 1",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        color: Colors.teal,
        alignment: Alignment.center,
      ),
      Container(
        height: 100,
        child: Text(
          "Sabit liste elemanı 1",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        color: Colors.purple,
        alignment: Alignment.center,
      ),
      Container(
        height: 100,
        child: Text(
          "Sabit liste elemanı 1",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        color: Colors.green,
        alignment: Alignment.center,
      ),
      Container(
        height: 100,
        child: Text(
          "Sabit liste elemanı 1",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        color: Colors.blue,
        alignment: Alignment.center,
      ),
      Container(
        height: 100,
        child: Text(
          "Sabit liste elemanı 1",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        color: Colors.pink,
        alignment: Alignment.center,
      ),
    ];
  }

  Widget _dinamikElemanUretenFonksiyon(BuildContext context, int index) {
    return Container(
      height: 100,
      child: Text(
        "Dinamik liste elemanı $index",
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
      color: rastgeleRenkUret(),
      alignment: Alignment.center,
    );
  }

  Color rastgeleRenkUret() {
    return Color.fromARGB(
        math.Random().nextInt(255),
        math.Random().nextInt(255),
        math.Random().nextInt(255),
        math.Random().nextInt(255));
  }
}
