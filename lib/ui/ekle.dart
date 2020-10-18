import 'package:flutter/material.dart';
import 'package:flutterapp/Models/veri.dart';

class EklemeSayfasi extends StatefulWidget {
  EklemeSayfasi(Key k) : super(key: k);

  @override
  _EklemeSayfasiState createState() => _EklemeSayfasiState();
}

class _EklemeSayfasiState extends State<EklemeSayfasi> {
  List<Veri> tumVeriler;

  @override
  void initState() {
    // TODO: implement initState
    tumVeriler = [
      Veri("Biz Kimiz", "Biz Kimizin İçeriği buraya gelecek", false),
      Veri("Biz Kimiz", "Biz Kimizin İçeriği buraya gelecek", false),
      Veri("Biz Kimiz", "Biz Kimizin İçeriği buraya gelecek", false),
      Veri("Biz Kimiz", "Biz Kimizin İçeriği buraya gelecek", false),
      Veri("Biz Kimiz", "Biz Kimizin İçeriği buraya gelecek", false),
      Veri("Biz Kimiz", "Biz Kimizin İçeriği buraya gelecek", false),
      Veri("Biz Kimiz", "Biz Kimizin İçeriği buraya gelecek", false),
      Veri("Biz Kimiz", "Biz Kimizin İçeriği buraya gelecek", false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return ExpansionTile(
            key: PageStorageKey("$index"),
            title: Text(tumVeriler[index].Baslik),
            initiallyExpanded: tumVeriler[index].expanded,
            children: <Widget>[
              Container(
                color: index % 2 == 0 ? Colors.indigo[200] : Colors.pink[200],
                height: 100,
                width: double.infinity,
                child: Text(tumVeriler[index].icerik),
              )
            ],
          );
        });
  }
}
