import 'package:flutter/material.dart';

class TabbarOrnek extends StatefulWidget {
  @override
  _TabbarOrnekState createState() => _TabbarOrnekState();
}

class _TabbarOrnekState extends State<TabbarOrnek> with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController=TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab Ornek"),
      bottom: TabBar(tabs: [
        Tab(
          icon: Icon(Icons.account_box),
          text: "tab 1",
        ),
        Tab(
          icon: Icon(Icons.account_box),
          text: "tab 2",

        ),
        Tab(
          icon: Icon(Icons.account_box),
          text: "tab 3",
        )
      ],controller: tabController,) ,),
      body: TabBarView(children: <Widget>[
        Container(color: Colors.redAccent,),
        Container(color: Colors.greenAccent,),
        Container(color: Colors.blueAccent,),
      ],controller: tabController,),

    );
  }
}
