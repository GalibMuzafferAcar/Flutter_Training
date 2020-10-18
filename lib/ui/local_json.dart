import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutterapp/models/Araba.dart';

class LocalJsonKullanimi extends StatefulWidget {
  @override
  _LocalJsonKullanimiState createState() => _LocalJsonKullanimiState();
}

class _LocalJsonKullanimiState extends State<LocalJsonKullanimi> {
  List<Araba> tumArabalar;

  @override
  /*void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint("çalıştı");
    VeriKaynaginiOku().then((gelenArabaListsi) {
      setState(() {
        tumArabalar = gelenArabaListsi;
      });
    });
  }*/

  @override
  Widget build(BuildContext context) {
    debugPrint("build çalıştı");
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Json Kullanımı "),
      ),
      body: Container(
          child: FutureBuilder(
              future: VeriKaynaginiOku(), builder: (context, sonuc) {
                tumArabalar=sonuc.data;
                if(sonuc.hasData){
                  return ListView.builder(
                      itemCount: tumArabalar.length, itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(title: Text(tumArabalar[index].araba_adi),
                          subtitle: Text("Menşei:"+tumArabalar[index].ulke+"\nModeller:"+ModelGetir(index)),),
                      ],
                    );
                  });

                }
                else
                  return Center(child: CircularProgressIndicator(),);
          })
      ),
    );
  }

  /* @override
  Widget build(BuildContext context) {
    debugPrint("build çalıştı");
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Json Kullanımı "),
      ),
      body: tumArabalar != null ? Container(
        child: ListView.builder(itemCount: tumArabalar.length,itemBuilder: (context,index){
          return ListTile(title:Text(tumArabalar[index]["araba_adi"]),
          subtitle: Text(tumArabalar[index]["ulke"]),);
        })
        
      ):Center(child: CircularProgressIndicator(),),
    );
  }*/

  Future<List<Araba>> VeriKaynaginiOku() async {
    /*Future<String> jsonOku =
        DefaultAssetBundle.of(context).loadString("assets/data/araba.json");
    jsonOku.then((okunanjson) {
      debugPrint("gelen json :" + okunanjson);
      return okunanjson;
    });*/
    var gelenJson = await DefaultAssetBundle.of(context).loadString(
        "assets/data/araba.json");
    debugPrint(gelenJson);
    List<Araba> arabaListesi = (json.decode(gelenJson) as List).map((mapYapisi)=>Araba.fromJsonMap(mapYapisi)).toList();
    debugPrint("Toplam araba sayısı " + arabaListesi.length.toString());
    for (int i = 0; i < arabaListesi.length; i++) {
      debugPrint("Markalar : " + arabaListesi[i].araba_adi);
      for (int j = 0; j < arabaListesi[i].model.length; j++) {
        debugPrint("Modeller : " + arabaListesi[i].model[j].model_adi);
      }
      debugPrint("");
    }
    return arabaListesi;
  }

  String ModelGetir(int index) {
    String modeladi="";
    for (int j = 0; j < tumArabalar[index].model.length; j++) {
      if(j==tumArabalar[index].model.length-1){
        modeladi=modeladi+tumArabalar[index].model[j].model_adi;
      }
      else modeladi=modeladi+tumArabalar[index].model[j].model_adi+",";
    }
    return modeladi;
  }
}
