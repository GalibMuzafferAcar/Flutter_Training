import 'package:flutter/material.dart';

String baslik = "B sayfasi";

class NavigasyonIslemleri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Navigasyon İşlemleri",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(child: Butonlar()),
        ));
  }
}

class ASayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "A Sayfasi",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "A Sayfası",
                style: TextStyle(color: Colors.white),
              ),
              RaisedButton(
                child: Text(
                  "A sayfasına git",
                ),
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ASayfasi(),
                      ));
                },
              ),
              RaisedButton(
                child: Text(
                  "B sayfasına git",
                ),
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BSayfasi(baslik),
                    ),
                  );
                },
              ),
              RaisedButton(
                child: Text(
                  "C sayfasına git",
                ),
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CSayfasi(),
                      ));
                },
              )
            ],
          ),
        ));
  }
}

class BSayfasi extends StatelessWidget {
  String gelenBaslikVerisi;

  BSayfasi(this.gelenBaslikVerisi);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            gelenBaslikVerisi,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                gelenBaslikVerisi,
                style: TextStyle(color: Colors.white),
              ),
              RaisedButton(
                child: Text(
                  "A sayfasına git",
                ),
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ASayfasi(),
                      ));
                },
              ),
              RaisedButton(
                child: Text(
                  "B sayfasına git",
                ),
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BSayfasi(baslik),
                    ),
                  );
                },
              ),
              RaisedButton(
                child: Text(
                  "C sayfasına git",
                ),
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CSayfasi(),
                      ));
                },
              )
            ],
          ),
        ));
  }
}

class CSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "C Sayfasi",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "C Sayfası",
                style: TextStyle(color: Colors.white),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.purple,
                child: Text("Geri dön"),
              ),
              Butonlar()
            ],
          ),
        ));
  }
}

class DSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "D Sayfasi",
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "D Sayfası",
                    style: TextStyle(color: Colors.white),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    color: Colors.purple,
                    child: Text("Geri dön ve veri gönder"),
                  ),
                  Butonlar()
                ],
              ),
            )),
        onWillPop: () {
          debugPrint("on will pop çalıştı");
          Navigator.pop(context, false);
          return Future.value(false);
        });
  }
}

class ESayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "E Sayfasi",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "E Sayfası",
                style: TextStyle(color: Colors.white),
              ),
              RaisedButton(
                child: Text(
                  "A sayfasına git",
                ),
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ASayfasi(),
                      ));
                },
              ),
              RaisedButton(
                child: Text(
                  "B sayfasına git",
                ),
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BSayfasi(baslik),
                    ),
                  );
                },
              ),
              RaisedButton(
                child: Text(
                  "C sayfasına git",
                ),
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CSayfasi(),
                      ));
                },
              )
            ],
          ),
        ));
  }
}

class Butonlar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text(
            "A sayfasına git",
          ),
          color: Colors.blue,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ASayfasi(),
                ));
          },
        ),
        RaisedButton(
          child: Text(
            "B sayfasına git",
          ),
          color: Colors.blue,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BSayfasi(baslik),
              ),
            );
          },
        ),
        RaisedButton(
          child: Text(
            "C sayfasına git",
          ),
          color: Colors.blue,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CSayfasi(),
                ));
          },
        ),
        RaisedButton(
          child: Text(
            "D sayfasına git ve gelirken veri getir",
          ),
          color: Colors.blue,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DSayfasi(),
                )).then((popdangelendeger) {
              debugPrint("Pop işleminden gelen değer $popdangelendeger");
            });
          },
        ),
        RaisedButton(
          child: Text(
            "E sayfasına git ve geri geleme",
          ),
          color: Colors.blue,
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ESayfasi(),
                ));
          },
        ),
        RaisedButton(
          child: Text(
            "Liste İşlemleri",
          ),
          color: Colors.blue,
          onPressed: () {
            Navigator.pushNamed(context, "/ListeSayfasi");
          },
        ),
        RaisedButton(
          child: Text(
            "Text Field İşlemleri",
          ),
          color: Colors.blue,
          onPressed: () {
            Navigator.pushNamed(context, "/TextFieldIslemleri");
          },
        ),
        RaisedButton(
          child: Text(
            "Form İşlemleri",
          ),
          color: Colors.blue,
          onPressed: () {
            Navigator.pushNamed(context, "/FormIslemleri");
          },
        ),
        RaisedButton(
          child: Text(
            "Tarih İşlemleri",
          ),
          color: Colors.blue,
          onPressed: () {
            Navigator.pushNamed(context, "/TarihIslemleri");
          },
        ),
        RaisedButton(
          child: Text(
            "Stepper İşlemleri",
          ),
          color: Colors.blue,
          onPressed: () {
            Navigator.pushNamed(context, "/StepperOrnek");
          },
        ),
        RaisedButton(
          child: Text(
            "Font İşlemleri",
          ),
          color: Colors.blue,
          onPressed: () {
            Navigator.pushNamed(context, "/FontTest");
          },
        ),
        RaisedButton(
          child: Text(
            "TabbarOrnek",
          ),
          color: Colors.blue,
          onPressed: () {
            Navigator.pushNamed(context, "/TabbarOrnek");
          },
        ),
        RaisedButton(
          child: Text(
            "Local json",
          ),
          color: Colors.blue,
          onPressed: () {
            Navigator.pushNamed(context, "/LocalJson");
          },
        ),
        RaisedButton(
          child: Text(
            "Remote json",
          ),
          color: Colors.blue,
          onPressed: () {
            Navigator.pushNamed(context, "/RemoteJson");
          },
        )
      ],
    );
  }
}

class ListeSinifi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Liste",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/detay/$index");
              },
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Liste Elemanı $index"),
              )),
            );
          },
          itemCount: 60,
        ));
  }
}

class ListeDetay extends StatelessWidget {
  int tiklanilanindex = 0;

  ListeDetay(this.tiklanilanindex);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Liste",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Liste Elemanı $tiklanilanindex tıklanıldı "),
        )));
  }
}
