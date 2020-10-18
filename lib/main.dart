import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/ui/MyApp.dart';
import 'package:flutterapp/ui/ResimVeButonTurleri.dart';
import 'package:flutterapp/ListeDersleri.dart';
import 'package:flutterapp/ui/Etkin_Liste_Ornek.dart';
import 'package:flutterapp/ui/Grid_view.dart';
import 'package:flutterapp/ui/CustomScrollViewTest.dart';
import 'package:flutterapp/ui/navigasyon_islemleri.dart';
import 'package:flutterapp/ui/input_test.dart';
import 'package:flutterapp/ui/remote_json.dart';
import 'package:flutterapp/ui/rowcol.dart';
import 'package:flutterapp/ui/stateful_test.dart';
import 'package:flutterapp/ui/text_field_ozellikleri.dart';
import 'package:flutterapp/ui/datetimepicker_test.dart';
import 'package:flutterapp/ui/stepper_test.dart';
import 'package:flutterapp/ui/font_test.dart';
import 'package:flutterapp/ui/tabbar_ornek.dart';
import 'package:flutterapp/ui/local_json.dart';
Brightness secim= Brightness.dark;
void main() => runApp(MaterialApp(
      title: "Flutter Dersleri",
      initialRoute: '/LocalJson',
      routes: {
        '/Cpage': (contex) => ESayfasi(),
        '/ListeSayfasi': (context) => ListeSinifi(),
        '/TextFieldIslemleri': (context) => TextFieldIslemleri(),
        '/FormIslemleri': (context)=> FormVeTextFromField(),
        '/TarihIslemleri':(context)=> olustur(),
        '/StepperOrnek': (context)=> StepperOrnek(),
        '/FontTest': (context)=> FontsTest(),
        '/TabbarOrnek':(context)=> TabbarOrnek(),
        '/LocalJson': (context)=> LocalJsonKullanimi(),
        '/RemoteJson': (context)=> RemoteJson(),
        '/RowCol': (context)=> RowCol(),
        '/ResimVeButon': (context)=> ResimVeButonTurleri(),
        '/Statetest': (context)=> StateTest(title: "Stateful",),
        '/Liste': (context)=> ListeDersleri(),
        '/Grid':(context)=> GridViewOrnek(),
        '/EtkinListe':(context)=> EtkinListeOrnek(),
        '/Sliver':(context)=> CollapsableToolBarOrnek(),
      },
      onGenerateRoute: (RouteSettings settings) {
        List<String> pathElemanlari = settings.name.split("/");
        if (pathElemanlari[1] == "detay") {
          return MaterialPageRoute(
              builder: (contex) => ListeDetay(int.parse(pathElemanlari[2])));
        }
        return null;
      },
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        brightness: secim,
      ),
      home: NavigasyonIslemleri(),
    ));
