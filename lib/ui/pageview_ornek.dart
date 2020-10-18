import 'package:flutter/material.dart';
import 'arama.dart';
import 'anasayfa.dart';
import 'ekle.dart';
import 'font_test.dart';

class PageViewOrnek extends StatefulWidget {
  @override
  _PageViewOrnekState createState() => _PageViewOrnekState();
}

class _PageViewOrnekState extends State<PageViewOrnek> {
  var myController =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
  var keyAnasayfa = PageStorageKey("key_ana_sayfa");
  bool yataEksen=true;
  bool pageSnapping=true;
  bool reverseSira=false;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: PageView(
            scrollDirection:yataEksen==true ?Axis.horizontal:Axis.vertical,
            reverse: reverseSira,
            controller: myController,
            pageSnapping: pageSnapping,
            onPageChanged: (index) {
              debugPrint("$index");
            },
            children: <Widget>[
              Anasayfa(),
              Container(
                width: double.infinity,
                height: 300,
                color:Colors.indigo,
                child: Column(
                  children: <Widget>[
                    Center(child: Text("Sayfa 1",style: TextStyle(fontSize: 30),),),
                    RaisedButton(onPressed: (){
                      myController.jumpToPage(2);
                    },child:Text("2.sayfaya git") ,)
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 300,
                color:Colors.pink,
                child: Center(child: Text("Sayfa 1",style: TextStyle(fontSize: 30),),)              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  Text("Yatay eksende çalış"),Checkbox(value: yataEksen, onChanged: (b){
                    setState(() {
                      yataEksen=b;
                    });
                  })
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  Text("Page Snapping"),Checkbox(value: pageSnapping, onChanged: (b){
                    setState(() {
                      pageSnapping=b;
                    });
                  })
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  Text("Reverse"),Checkbox(value: reverseSira, onChanged: (b){
                    setState(() {
                      reverseSira=b;
                    });
                  })
                ],),
              )


            ],
          )

        )
      ],
    );
  }
}
