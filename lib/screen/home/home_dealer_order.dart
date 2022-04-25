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
        Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.black,
                    blurRadius: 5.0,
                  ),
                ]),
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xffE31E30),
                        ),
                        child: Text(
                          'D',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 20, 20, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Welcome Dealer Name'.tr,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18,
                              )),
                          Text('IDNumber'.tr,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                                fontSize: 18,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Colors.red,
                  child: Image.asset(
                    'images/shree-cement-500x500_2.png',
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(7),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xffE31E30),
                        onPrimary: const Color(0xffffffff),
                        textStyle: TextStyle(
                          fontSize: 15,
                          color: Color(0xffffffff),
                        )),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text('Place New Order'.toUpperCase()))
              ],
            )
            // child: Text('Welcome'.tr,
            //     style: TextStyle(
            //         fontWeight: FontWeight.bold, color: Colors.black,
            //     fontSize: 18,
            //     )),
            ),
        Container(
          width: double.infinity,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
          decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                new BoxShadow(
                  color: Colors.black,
                  blurRadius: 5.0,
                ),
              ]),
          child: Column(
            children: <Widget>[
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xffE31E30),
                      onPrimary: const Color(0xffffffff),
                      textStyle: TextStyle(
                        fontSize: 15,
                        color: Color(0xffffffff),
                      )),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text('Past Orders'.toUpperCase())),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xffE31E30),
                      onPrimary: const Color(0xffffffff),
                      textStyle: TextStyle(
                        fontSize: 15,
                        color: Color(0xffffffff),
                      )),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text('Orders waiting under evaluation'.toUpperCase()))
            ],
          ),
        ),
        // Card(
        //   semanticContainer: true,
        //   clipBehavior: Clip.antiAliasWithSaveLayer,
        //   color: Colors.red,
        //   child: Image.network(
        //     'https://www.shreecement.com/uploads/news-list/shree-cement-500x500_2.png',
        //     fit: BoxFit.fill,
        //   ),
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(10.0),
        //   ),
        //   elevation: 5,
        //   margin: EdgeInsets.all(10),
        // ),
        //     GestureDetector(
        //       child: Text('applyfordealership'.tr,
        //           style: TextStyle(
        //               fontWeight: FontWeight.bold, color: Colors.blueAccent)),
        //       onTap: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(builder: (context) => OnBoardOnePage()),
        //         );
        //       },
        //     ),

        // ElevatedButton(
        //     onPressed: () {
        //       var locale = Locale('en', 'US');
        //       Get.updateLocale(locale);
        //     },
        //     child: Text('english'.tr)),
        // ElevatedButton(
        //     onPressed: () {
        //       var locale = Locale('hi', 'IN');
        //       Get.updateLocale(locale);
        //     },
        //     child: Text('hindi'.tr))
      ])),
      drawer: const DrawerPage(),
    );
  }
}
