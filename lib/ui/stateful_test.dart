import 'package:flutter/material.dart';
class StateTest extends StatefulWidget {
  String title;
  StateTest({String title}) {
    this.title = title;
    debugPrint("MyhHomePage const ");
  }

  @override
  _StateTestState createState() => _StateTestState();
}

class _StateTestState extends State<StateTest> {
  int sayac = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              sayacdegeriniarttir();
              widget.title="Stateful ${sayac}";

            });
          },
          child: Icon(Icons.add),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(child: Text("Arttır"),color: Colors.purple,onPressed: (){
                setState(() {
                  sayacdegeriniarttir();
                });
              },),
              Text(
                sayac.toString(),
                style: Theme.of(context).textTheme.display2.copyWith(
                    color: sayac<0 ? Colors.red : Colors.teal
                ),
              ),
              RaisedButton(child: Text("Azalt"),color: Colors.purple,onPressed: (){
                setState(() {
                  sayacdegeriniazalt();
                });
              },),
            ],
          ),
        ));
  }
  void sayacdegeriniarttir() {
    sayac++;
    debugPrint("Sayac degeri : ${sayac}");
  }
  void sayacdegeriniazalt() {
    sayac--;
    debugPrint("Sayac degeri : ${sayac}");
  }

}

