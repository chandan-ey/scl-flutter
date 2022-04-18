import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import '/screen/dealeronboarding/step1.dart';
import '../drawer/drawer.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dealerhome'.tr),
        backgroundColor: Color.fromRGBO(227, 30, 48, 1),
        actions: [
          IconButton(
            onPressed: null, //() => Navigator.of(context)
            //.push(MaterialPageRoute(builder: (_) => SearchPage())),
            icon: Icon(
              CupertinoIcons.bell_fill,
              color: Color.fromRGBO(255, 255, 255, 0.74),
            ),
          ),
          // Navigate to the Search Screen
          IconButton(
            onPressed: null, //() => Navigator.of(context)
            //.push(MaterialPageRoute(builder: (_) => SearchPage())),
            icon: Icon(
              CupertinoIcons.search,
              color: Color.fromRGBO(255, 255, 255, 0.74),
            ),
          )
        ],
      ),
      body: Center(
          child: Column(children: <Widget>[
        GestureDetector(
          child: Text('applyfordealership'.tr,
              style: TextStyle(
                  decoration: TextDecoration.underline, color: Colors.orange)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OnBoardOnePage()),
            );
          },
        ),
        ElevatedButton(
            onPressed: () {
              var locale = Locale('en', 'US');
              Get.updateLocale(locale);
            },
            child: Text('english'.tr)),
        ElevatedButton(
            onPressed: () {
              var locale = Locale('hi', 'IN');
              Get.updateLocale(locale);
            },
            child: Text('hindi'.tr))
      ])),
      drawer: const DrawerPage(),
    );
  }
}
