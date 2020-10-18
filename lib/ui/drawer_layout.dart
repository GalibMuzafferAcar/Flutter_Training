import 'package:flutter/material.dart';
class DrawerMenu extends StatefulWidget {
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Galib Muzaffer Acar"),
            accountEmail: Text("galibmacar@gmail.com"),
            currentAccountPicture: ClipOval(
              child: Image.network(
                  "https://pbs.twimg.com/profile_images/1061032950098288645/hR4ZtEsB_400x400.jpg"),
            ),
            otherAccountsPictures: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.purple,
                child: Text("GMA"),
              )
            ],
          ),
          Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Anasayfa"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  ListTile(
                    leading: Icon(Icons.call),
                    title: Text("Ara"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text("Mail"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  Divider(),ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Anasayfa"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  ListTile(
                    leading: Icon(Icons.call),
                    title: Text("Ara"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  InkWell(
                    child: ListTile(
                      leading: Icon(Icons.email),
                      title: Text("Mail"),
                      trailing: Icon(Icons.chevron_right),
                    ),
                    onTap: (){},
                    splashColor: Colors.cyan,
                  ),
                  Divider(),

                ],
              ))
        ],
      ),
    );
  }
}
