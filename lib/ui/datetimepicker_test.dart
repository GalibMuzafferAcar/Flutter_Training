import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';


class _TarihSaatIslemleri extends StatefulWidget {
  @override
  __TarihSaatIslemleriState createState() => __TarihSaatIslemleriState();
}

class __TarihSaatIslemleriState extends State<_TarihSaatIslemleri> {
  @override
  Widget build(BuildContext context) {
    DateTime suan=DateTime.now();
    DateTime ucAyOnce=DateTime(2020,suan.month-3);
    DateTime yirmiGunSonra=DateTime(2020,suan.month,suan.day+20);
    TimeOfDay suankisaat=TimeOfDay.now();
    return Scaffold(
      appBar: AppBar(
        title: Text("Date Time Picker"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                showDatePicker(context: context, initialDate: suan, firstDate: ucAyOnce, lastDate: yirmiGunSonra).then((secilenTarih) {
                  debugPrint(secilenTarih.toString());
                  debugPrint(secilenTarih.toIso8601String());
                  debugPrint(secilenTarih.millisecondsSinceEpoch.toString());
                  debugPrint(secilenTarih.toUtc().toString());
                  debugPrint(secilenTarih.add(Duration(days: 20)).toString());
                  debugPrint(formatDate(secilenTarih, [yyyy, '-', mm, '-', dd]));

                });
              },
              child: Text("Tarih Sec"),
              color: Colors.teal,
            ),
            RaisedButton(
              onPressed: () {
                showTimePicker(context: context, initialTime: suankisaat).then((secilenSaat){
                  debugPrint(secilenSaat.format(context));
                  debugPrint(secilenSaat.hour.toString()+ " "+secilenSaat.minute.toString());

                });

              },
              child: Text("Saat Sec"),
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}

Widget olustur() {
  return _TarihSaatIslemleri();
}
