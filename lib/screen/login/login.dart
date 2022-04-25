import 'package:flutter/material.dart';
import '../otp/OtpInput.dart';
import '../home/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool sendSMS = true;

  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();

  void _changed() {
    setState(() {
      sendSMS = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/industry.jfif"), fit: BoxFit.fill)),
        ),
        Column(
          // Vertically center the widget inside the column
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  //decoration: const BoxDecoration(color: Color(0xff000000)),
                  color: Colors.black.withOpacity(0.55),
                  child: Column(
                    children: [
                      Row(
                        children: <Widget>[
                          const Expanded(
                              flex: 12,
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              )),
                          Expanded(
                              flex: 5,
                              child: Align(
                                child: Image.asset(
                                  "images/shreecement.png",
                                  width: 139,
                                  height: 42,
                                ),
                                alignment: Alignment.topRight,
                              )),
                        ],
                      ),
                      Visibility(
                        visible: sendSMS,
                        child: Column(children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              maxLength: 10,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      // borderRadius: BorderRadius.all(10.0),
                                      ),
                                  hintText: 'Mobile Number'),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: 350,
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color(0xffFBBC33),
                                    onPrimary: const Color(0xff000000),
                                    textStyle: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                  onPressed: () {
                                    _changed();
                                  },
                                  child: const Text('Generate OTP'),
                                ),
                              ),
                            ],
                          )
                        ]),
                        replacement: Column(children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                OtpInput(_fieldOne, true),
                                OtpInput(_fieldTwo, false),
                                OtpInput(_fieldThree, false),
                                OtpInput(_fieldFour, false)
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: 350,
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: const Color(0xffFBBC33),
                                      onPrimary: const Color(0xff000000),
                                      textStyle: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff000000),
                                      )),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const HomePage(),
                                      ),
                                    );
                                  },
                                  child: const Text('Submit'),
                                ),
                              ),
                            ],
                          )
                        ]),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ],
    ));
  }
}
