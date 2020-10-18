import 'package:flutter/material.dart';

class ListeDersleri extends StatelessWidget {
  //Liste için veri kaynağı
  List<int> listeNumaralari = List.generate(50, (index) => index + 1);
  List<String> listeAltBasliklar =
      List.generate(51, (index) => "Liste elemanı alt baslık $index");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste Dersleri"),
      ),
      body: ListView(
          children: listeNumaralari
              .map(
                (oankieleman) => Column(
                  children: <Widget>[
                    Container(
                      child: Card(
                        color: Colors.deepOrange[300],
                        margin: EdgeInsets.all(5),
                        elevation: 10,
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Icon(
                              Icons.person,
                            ),
                            radius: 12,
                          ),
                          title: Text("Liste Eleman Baslık $oankieleman"),
                          subtitle: Text(listeAltBasliklar[oankieleman]),
                          trailing: Icon(Icons.add_circle),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.deepOrange,
                    ),
                  ],
                ),
              )
              .toList()),
    );
  }
}
/*
 <Widget>[

      ],
*/
