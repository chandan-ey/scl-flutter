import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  Widget userHeader = UserAccountsDrawerHeader(
    accountName: new Text(
      'Shree Cements',
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
    ),
    accountEmail: new Text(
      'tom@xxx.com',
      style: TextStyle(color: Colors.black),
    ),
    currentAccountPicture: new CircleAvatar(
      backgroundImage: AssetImage('web/icons/user_icon.png'),
      backgroundColor: Colors.grey[350],
      radius: 100.0,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            userHeader, //Custom header can be replaced here
            ListTile(
              title: Text('Item 1'),
              leading: new CircleAvatar(
                child: new Icon(Icons.school),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              leading: new CircleAvatar(
                child: new Text('B2'),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 3'),
              leading: new CircleAvatar(
                child: new Icon(Icons.list),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
