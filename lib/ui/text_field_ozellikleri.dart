import 'package:flutter/material.dart';
import 'package:flutterapp/main.dart';

class FormVeTextFromField extends StatefulWidget {
  @override
  _FormVeTextFromFieldState createState() => _FormVeTextFromFieldState();
}

class _FormVeTextFromFieldState extends State<FormVeTextFromField> {
  String _adSoyad, _sifre, _emailadres;
  final formKey = GlobalKey<FormState>();
  bool otomatikKontrol = false;
  bool checkBoxKontrol = false;
  String sehir = "";
  bool switchState = false;
  double sliderDeger = 0;
  String secilenRenk = "Kırmızı";
  List<String> sehirler = ["İstanbul", "Ankara", "İzmir"];
  String secilenSehir = "Ankara";

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(brightness: secim, errorColor: Colors.purple),
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                if (secim == Brightness.dark)
                  secim = Brightness.light;
                else
                  secim = Brightness.dark;
              });
            },
            child: Icon(Icons.add_circle_outline),
          ),
          appBar: AppBar(
            title: Text("From ve TextFormField"),
          ),
          body: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
                key: formKey,
                autovalidate: otomatikKontrol,
                child: ListView(
                  children: <Widget>[

                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_circle),
                          hintText: "Adınız Ve Soy Adınız",
                          labelText: "Ad Soyad",
                          border: OutlineInputBorder()),
                      validator: (String girilenVeri) {
                        if (girilenVeri.length < 6) {
                          return "lütfen düzgün gir";
                        } else
                          return null;
                      },
                      onSaved: (deger) => _adSoyad = deger,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.alternate_email),
                          hintText: "Email adresiniz",
                          labelText: "Email",
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      validator: (String girilenVeri) {
                        if (girilenVeri.contains("@") == false)
                          return "Geçerli bir Email giriniz";
                        else
                          return null;
                      },
                      onSaved: (deger) => _emailadres = deger,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: "Şifreniz",
                          labelText: "şifre",
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      validator: (String girilenVeri) {
                        if (girilenVeri.length < 6) {
                          return "Lütfen düzgün giriniz";
                        } else
                          return null;
                      },
                      onSaved: (deger) => _sifre = deger,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton.icon(
                      icon: Icon(Icons.save),
                      label: Text("KAYDET"),
                      color: Colors.blueAccent,
                      disabledColor: Colors.amber,
                      onPressed: _girisBilgileriniOnayla,
                    ),
                    CheckboxListTile(
                      value: checkBoxKontrol,
                      onChanged: (secildi) {
                        setState(() {
                          checkBoxKontrol = secildi;
                        });
                      },
                      title: Text("title"),
                      subtitle: Text("Subtitle"),
                      secondary: Icon(Icons.save),
                      activeColor: Colors.purple,
                    ),
                    RadioListTile<String>(
                      value: "Ankara",
                      groupValue: sehir,
                      onChanged: (deger) {
                        setState(() {
                          sehir = deger;
                          debugPrint(deger);
                        });
                      },
                      title: Text("Ankara"),
                    ),
                    RadioListTile<String>(
                        value: "Samsun",
                        groupValue: sehir,
                        onChanged: (deger) {
                          setState(() {
                            sehir = deger;
                            debugPrint(deger);
                          });
                        },
                        title: Text("Samsun")),
                    RadioListTile<String>(
                      value: "İstanbul",
                      groupValue: sehir,
                      onChanged: (deger) {
                        setState(() {
                          sehir = deger;
                          debugPrint(deger);
                        });
                      },
                      title: Text("İstanbul"),
                      subtitle: Text("subtitle"),
                      secondary: Icon(Icons.lock),
                    ),
                    SwitchListTile(
                      value: switchState,
                      onChanged: (deger) {
                        setState(
                          () {
                            switchState = deger;
                          },
                        );
                      },
                      title: Text("title"),
                      subtitle: Text("subtitle"),
                      secondary: Icon(Icons.account_circle),
                    ),
                    Slider(
                      value: sliderDeger,
                      onChanged: (yenideger) {
                        setState(() {
                          sliderDeger = yenideger;
                        });
                      },
                      min: 0,
                      max: 20,
                      divisions: 20,
                      label: sliderDeger.toString(),
                    ),
                    DropdownButton<String>(
                      items: [
                        DropdownMenuItem<String>(
                          child: Text("Kırmızı"),
                          value: "Kırmızı",
                        ),
                        DropdownMenuItem<String>(
                          child: Text("Mavi"),
                          value: "Mavi",
                        ),
                        DropdownMenuItem<String>(
                          child: Text("Yeşil"),
                          value: "Yeşil",
                        ),
                      ],
                      onChanged: (String secilen) {
                        setState(() {
                          secilenRenk = secilen;
                        });
                      },
                      hint: Text("seciniz"),
                      value: secilenRenk,
                    ),
                    DropdownButton<String>(
                      items: sehirler.map((e) {
                        return DropdownMenuItem<String>(
                          child: Text(e),
                          value: e,
                        );
                      }).toList(),
                      onChanged: (s) {
                        setState(() {
                          secilenSehir = s;
                        });
                      },
                      value: secilenSehir,
                    )
                  ],
                )),
          )),
    );
  }

  void _girisBilgileriniOnayla() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      debugPrint("$_adSoyad    $_emailadres    $_sifre");
    } else {
      setState(() {
        otomatikKontrol = true;
      });
    }
  }
}
