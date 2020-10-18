import 'package:flutter/material.dart';

class ResimVeButonTurleri extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Resim Ve Buton Türleri"),),
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
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
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
                        FlutterLogo(
                          size: 60,
                          colors: Colors.orange,
                          style: FlutterLogoStyle.horizontal,
                        ),
                        Text("Flutter Logo")
                      ],
                    ),
                  )),
              Expanded(
                  child: Container(
                    margin: EdgeInsets.all(4),
                    color: Colors.pink[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Placeholder(
                            color: Colors.red,
                            strokeWidth: 2.0,
                          ),
                        ),
                        Text("Placeholder widget")
                      ],
                    ),
                  )),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                onPressed: () => debugPrint("Fat Arrow fonksiyon"),
                color: Colors.grey,
                child: Text("Raise Fat Arrow Button"),
                elevation: 12,
                textColor: Colors.purple,
              ),
              RaisedButton(
                onPressed: () {
                  debugPrint("1.satır");
                  debugPrint("2.satır");
                },
                color: Colors.green,
                child: Text("Raise Lambda expression Button"),
                elevation: 12,
              ),
              RaisedButton(
                onPressed: uzunMethod,
                color: Colors.pink,
                child: Text("Raise method Button"),
                elevation: 12,
              ),
              IconButton(
                icon: Icon(Icons.add_circle),
                onPressed: uzunMethod,
                iconSize: 32,
              ),
              FlatButton(
                  onPressed: uzunMethod,
                  child: Text(
                    "Flat Button",
                    style: TextStyle(fontSize: 24),
                  ))
            ],
          ),
        ),
      ]),
    );
  }
}
          void uzunMethod() {
              debugPrint("Uzun içerikli method");
          }