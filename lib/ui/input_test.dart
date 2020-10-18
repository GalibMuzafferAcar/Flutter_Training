import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldIslemleri extends StatefulWidget {
  @override
  _TextFieldIslemleriState createState() => _TextFieldIslemleriState();
}

class _TextFieldIslemleriState extends State<TextFieldIslemleri> {
  String girilenMetin = "Merhaba";
  int maxLine = 1;
  FocusNode _fnode;
  TextEditingController textController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fnode = FocusNode();
    textController = TextEditingController(text: "varsayılan");
    _fnode.addListener(() {
      setState(() {
        if (_fnode.hasFocus) {
          maxLine = 3;
        } else {
          maxLine = 1;
        }
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _fnode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("İnput İşlemleri"),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 24,
            height: 24,
            child: FloatingActionButton(
              heroTag: "AAA",
              onPressed: () {
                textController.text="LOREM IPSUM DOLORIco";
              },
              child: Icon(
                Icons.add,
                size: 18,
              ),
              backgroundColor: Colors.purple,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: "a",
            onPressed: () {
              debugPrint(textController.text);
            },
            child: Icon(Icons.add),
            mini: true,
            backgroundColor: Colors.pink,
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: "aa",
            onPressed: () {
              FocusScope.of(context).requestFocus(_fnode);
            },
            child: Icon(Icons.add),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
                controller: textController,
                focusNode: _fnode,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                autofocus: false,
                maxLines: maxLine,
                maxLength: 20,
                maxLengthEnforced: true,
                onChanged: (String s) => debugPrint("On Change $s"),
                onSubmitted: (String s) => girilenMetin = s,
                cursorColor: Colors.pink,
                decoration: InputDecoration(
                    hintText: "Metni buraya yazınız",
                    labelText: "Başlık",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    icon: Icon(Icons.add_circle),
                    prefixIcon: Icon(Icons.arrow_forward),
                    suffixIcon: Icon(Icons.add),
                    fillColor: Colors.pink[500],
                    filled: true)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                autofocus: false,
                maxLines: 1,
                maxLength: 20,
                maxLengthEnforced: true,
                onChanged: (String s) => debugPrint("On Change $s"),
                onSubmitted: (String s) => girilenMetin = s,
                cursorColor: Colors.pink,
                decoration: InputDecoration(
                    hintText: "Metni buraya yazınız",
                    labelText: "Başlık",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    icon: Icon(Icons.add_circle),
                    prefixIcon: Icon(Icons.arrow_forward),
                    suffixIcon: Icon(Icons.add),
                    fillColor: Colors.pink[500],
                    filled: true)),
          ),
          Container(
            color: Colors.teal[400],
            margin: EdgeInsets.all(10),
            width: 200,
            height: MediaQuery.of(context).size.height / 2,
            child:
                Align(alignment: Alignment.center, child: Text(girilenMetin)),
          )
        ],
      ),
    );
  }
}
