import 'dart:convert';
import 'package:flutterapp/models/Gonderi.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class RemoteJson extends StatefulWidget {
  @override
  _RemoteJsonState createState() => _RemoteJsonState();
}

class _RemoteJsonState extends State<RemoteJson> {
  Gonderi gonderi;

  Future<List<Gonderi>> _gonderiGetir() async {
    var response =
        await http.get("https://jsonplaceholder.typicode.com/posts");
    if (response.statusCode == 200) {
      //return Gonderi.fromJsonMap(json.decode(response.body));
      return (json.decode(response.body) as List).map((tekGonderiMap) => Gonderi.fromJsonMap(tekGonderiMap)).toList();
    } else {
      throw Exception("Bağlanamadık ${response.statusCode}");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Remote Json Kullanımı "),
      ),
      body: FutureBuilder(
        future: _gonderiGetir(),
        builder: (BuildContext context, AsyncSnapshot<List<Gonderi>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(itemCount:snapshot.data.length,itemBuilder: (context,index){
              return ListTile(
                title: Text(snapshot.data[index].title),
                subtitle:Text(snapshot.data[index].body) ,
                leading: CircleAvatar(child: Text(snapshot.data[index].id.toString()),),
              ) ;
            });
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
    ;
  }
}
