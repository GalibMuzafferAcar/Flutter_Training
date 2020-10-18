import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'drawer_layout.dart';
import 'anasayfa.dart';
import 'arama.dart';
import 'ekle.dart';
import 'pageview_ornek.dart';

class FontsTest extends StatefulWidget {
  @override
  _FontsTestState createState() => _FontsTestState();
}

class _FontsTestState extends State<FontsTest> with SingleTickerProviderStateMixin {
  var _c =
  PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
  var keyAnasayfa = PageStorageKey("key_ana_sayfa");
  var keyArama = PageStorageKey("key_arama_sayfa");
  int secilenMenuItem = 0;
  TabController _tabController;
  void _tabControllerListener(){
    setState(() {
      secilenMenuItem = _tabController.index;
    });
  }
  List<Widget> gorunecekEkran;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_tabControllerListener);
    super.initState();
    gorunecekEkran = [
      Anasayfa(),
      AramaSayfasi(keyArama),
      EklemeSayfasi(keyAnasayfa),
      PageViewOrnek()
    ];
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    _tabController.removeListener(_tabControllerListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: Text("Fontlar"),
      ),
      body: PageView(
        controller: _c,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index){
          setState(() {
            secilenMenuItem=index;
          });
        },
        children: gorunecekEkran),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Anasayfa"),
            backgroundColor: Colors.amber),
        BottomNavigationBarItem(
            icon: Icon(Icons.call),
            title: Text("Ara"),
            backgroundColor: Colors.cyan),
        BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text("Ekle"),
            backgroundColor: Colors.purple),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            activeIcon: Icon(Icons.account_box),
            title: Text("profil"),
            backgroundColor: Colors.green),
      ],
      currentIndex: secilenMenuItem,
      onTap: (index) {
        //this._c.animateToPage(index,duration: const Duration(milliseconds: 1),curve: Curves.easeInOut);
        _c.jumpToPage(index);
      },

      type: BottomNavigationBarType.shifting,
      backgroundColor: Colors.red,
    );
  }
}
