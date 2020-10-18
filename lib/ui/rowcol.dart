import 'package:flutter/material.dart';

class RowCol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Image Ve Buton Türleri"),
            ],
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(4),
                    color: Colors.pink[200],
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          "images/Screenshot_10.png",
                        ),
                        Text("Asset Image")
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(4),
                    color: Colors.pink[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FadeInImage.assetNetwork(
                            placeholder: "images/Loading.gif",
                            image:
                                "https://i.pinimg.com/originals/3b/8a/d2/3b8ad2c7b1be2caf24321c852103598a.jpg"),
                        Text("Fadein Image")
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.all(4),
                  color: Colors.pink[200],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://static.rfstat.com/renderforest/images/v2/logo-homepage/gradient_2.png"),
                        radius: 30,
                      ),
                      Text("Circle Avatar")
                    ],
                  ),
                ))
              ],
            ),
          ),
        ]));
  }
}
