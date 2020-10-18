import 'package:flutter/material.dart';

class StepperOrnek extends StatefulWidget {
  @override
  _StepperOrnekState createState() => _StepperOrnekState();
}

class _StepperOrnekState extends State<StepperOrnek> {
  int _aktifStep = 0;
  String isim, mail, sifre;
  List<Step> tumStepler;
  bool hata = false;
  var key0 = GlobalKey<FormFieldState>();
  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    tumStepler = _tumStepler();
    return Scaffold(
      appBar: AppBar(
        title: Text("Stepper Örnek"),
      ),
      body: SingleChildScrollView(
        child: Stepper(
          steps: tumStepler,
          currentStep: _aktifStep,
/*          onStepTapped: (tiklanilanStep) {
            setState(() {
              _aktifStep = tiklanilanStep;
            });
          },*/
          onStepContinue: () {
            setState(() {
              _ileriButonuKontrol();
            });
          },
          onStepCancel: () {
            setState(() {
              if (_aktifStep > 0) {
                _aktifStep--;
              }
            });
          },
        ),
      ),
    );
  }

  List<Step> _tumStepler() {
    List<Step> stepler = [
      Step(
        title: Text("Username giriniz"),
        content: TextFormField(
          key: key0,
          decoration: InputDecoration(
              labelText: "Username",
              hintText: "UsernameHint",
              border: OutlineInputBorder()),
          validator: (girilenDeger) {
            if (girilenDeger.length < 6) {
              return "En az 6 karakter giriniz";
            }
          },
          onSaved: (girilenDeger) {
            isim = girilenDeger;
          },
        ),
        subtitle: Text("Username subtitle"),
        state: _stateleriAyarla(0),
        isActive: true,
      ),
      Step(
        title: Text("Mail giriniz"),
        content: TextFormField(
          key: key1,
          decoration: InputDecoration(
              labelText: "Mail",
              hintText: "MailHint",
              border: OutlineInputBorder()),
          validator: (girilenDeger) {
            if (girilenDeger.length < 6 || !girilenDeger.contains('@')) {
              return "En az 6 karakter giriniz";
            }
          },
          onSaved: (girilenDeger) {
            mail = girilenDeger;
          },
        ),
        subtitle: Text("Mail subtitle"),
        state: _stateleriAyarla(1),
        isActive: true,
      ),
      Step(
        title: Text("Şifre giriniz"),
        content: TextFormField(
          key: key2,
          decoration: InputDecoration(
              labelText: "şifre",
              hintText: "ŞifreHint",
              border: OutlineInputBorder()),
          validator: (girilenDeger) {
            if (girilenDeger.length < 6) {
              return "En az 6 karakter giriniz";
            }
          },
          onSaved: (girilenDeger) {
            sifre = girilenDeger;
          },
        ),
        subtitle: Text("Şifre subtitle"),
        state: _stateleriAyarla(2),
        isActive: true,
      )
    ];
    return stepler;
  }

  StepState _stateleriAyarla(int oankiStep) {
    if (_aktifStep == oankiStep) {
      if (hata) {
        return StepState.error;
      } else
        return StepState.editing;
    } else
      return StepState.complete;
  }

  void _ileriButonuKontrol() {
    switch(_aktifStep){
      case 0:
        if(key0.currentState.validate()){
          key0.currentState.save();
          hata=false;
          _aktifStep=1;
        }else hata=true;
        break;
      case 1:
        if(key1.currentState.validate()){
          key1.currentState.save();
          hata=false;
          _aktifStep=2;
        }else hata=true;
        break;
      case 2:
        if(key2.currentState.validate()){
          key2.currentState.save();
          hata=false;
          _aktifStep=2;
          formTamamlandi();
        }else hata=true;
        break;
    }
  }

  void formTamamlandi() {
    debugPrint(isim+" "+mail+" "+sifre);
  }
}
