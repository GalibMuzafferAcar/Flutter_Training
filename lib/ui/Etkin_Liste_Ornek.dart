import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EtkinListeOrnek extends StatelessWidget {
  List<Ogrenci> tumOgrenciler = [];

  @override
  Widget build(BuildContext context) {
    ogrenciVerileriniGetir();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("ListView"),),
      body: ListView.separated(
          separatorBuilder: (context, index) {
            if (index % 5 == 0 && index != 0) {
              return Divider(
                color: Colors.green,
              );
            } else
              return Divider();
          },
          itemCount: 20,
          itemBuilder: (context, index) {
            return Card(
              color: index % 2 == 0 ? Colors.blue[200] : Colors.yellow[200],
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text(tumOgrenciler[index]._isim),
                subtitle: Text(tumOgrenciler[index]._aciklama),
                trailing: Icon(Icons.add),
                onTap: () {
                  Fluttertoast.showToast(
                      msg: tumOgrenciler[index].toString(),
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  alertDialogGoster(context, index);
                },
                onLongPress: () => debugPrint(
                    tumOgrenciler[index]._cinsiyet == false ? "Erkek" : "Kadın"),
              ),
            );
          }),
    );
  }

  void ogrenciVerileriniGetir() {
    tumOgrenciler = List.generate(
        300,
        (index) => Ogrenci("Ogrenci $index Adı", "Ogrenci $index Acıklaması",
            index % 2 == 0 ? true : false));
  }

  void alertDialogGoster(BuildContext ctx, int index) {
    showDialog(
        context: ctx,
        barrierDismissible: false,
        builder: (ctx) {
          return AlertDialog(
            title: Text("Alert Dialog Başlığı"),
            content: SingleChildScrollView(
                child: ListBody(
              children: <Widget>[
                Text(
                    "${tumOgrenciler[index].toString()} \n ikinci satır \n üçüncü satır \n\n\n"),
              ],
            )),
            actions: <Widget>[
              ButtonBarTheme(
                data: ButtonBarThemeData(),
                child: ButtonBar(
                  children: <Widget>[
                    FlatButton(onPressed: () {}, child: Text("Tamam")),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text("Kapat"),
                    )
                  ],
                ),
              )
            ],
          );
        });
  }
}

class Ogrenci {
  String _isim;
  String _aciklama;
  bool _cinsiyet;

  Ogrenci(this._isim, this._aciklama, this._cinsiyet);

  @override
  String toString() {
    // TODO: implement toString
    return "${this._isim} ${this._cinsiyet == false ? "Erkek" : "Kadın"}";
  }
}
