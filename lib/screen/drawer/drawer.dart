import 'package:flutter/material.dart';
import '../../screen/home/home.dart';
import '../dealeronboarding/step1.dart';
import '../login/login.dart';

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
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
    ),
    accountEmail: new Text(
      '',
      style: TextStyle(color: Colors.black, fontSize: 14),
    ),
    currentAccountPicture: new CircleAvatar(
      backgroundImage: AssetImage('images/user_icon.png'),
      backgroundColor: Colors.grey[350],
      radius: 50.0,
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
              title: Text('Home'),
              // leading: new CircleAvatar(
              //   child: new Icon(Icons.school),
              // ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              title: Text('Apply For Dealership'),
              // leading: new CircleAvatar(
              //   child: new Text('B2'),
              // ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OnBoardOnePage()),
                );
              },
            ),
            ListTile(
              title: Text('Logout'),
              // leading: new CircleAvatar(
              //   child: new Text('B2'),
              // ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
