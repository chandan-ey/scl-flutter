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
  int mobileNumberLength = 0;
  int otpLength = 0;
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final mobileNoTextController = TextEditingController();
  bool _validate = false;
  bool _validMobile = false;
  bool _validOTP = false;
  validateMobile() {
    mobileNumberLength = mobileNoTextController.text.length;
    setState(() {
      if (mobileNumberLength == 10) {
        _validMobile = true;
      } else {
        _validMobile = false;
      }
    });
  }

  validateOTP() {
    setState(() {
      if (_fieldOne.text.length == 1 &&
          _fieldTwo.text.length == 1 &&
          _fieldThree.text.length == 1 &&
          _fieldFour.text.length == 1) {
        _validOTP = true;
      } else {
        _validOTP = false;
      }
    });
  }

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    mobileNoTextController.addListener(validateMobile);
    _fieldOne.addListener(validateOTP);
    _fieldTwo.addListener(validateOTP);
    _fieldThree.addListener(validateOTP);
    _fieldFour.addListener(validateOTP);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    mobileNoTextController.dispose();
    super.dispose();
  }

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
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 55,
                                margin: const EdgeInsets.only(
                                    bottom: 22.0, left: 5.0),
                                child: TextFormField(
                                  readOnly: true,
                                  style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  decoration: const InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    border: InputBorder.none,
                                    // border: OutlineInputBorder(
                                    //   borderRadius: BorderRadius.only(topRight: Radius.circular(0), bottomRight: Radius.circular(0)),
                                    // ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 7.0, horizontal: 10.0),
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: '+91',
                                  ),
                                ),
                              ),
                              Container(
                                width: 290,
                                child: TextFormField(
                                  controller: mobileNoTextController,
                                  maxLength: 10,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 16.0, horizontal: 10.0),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Mobile Number',
                                  ),
                                  style: const TextStyle(
                                      fontSize: 18.0, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 350,
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: _validMobile
                                        ? const Color(0xffFBBC33)
                                        : const Color(0xffcccccc),
                                    onPrimary: const Color(0xff000000),
                                    textStyle: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (mobileNumberLength == 10) {
                                      _changed();
                                    }
                                  },
                                  child: const Text('Generate OTP'),
                                ),
                              ),
                            ],
                          ),
                          Row(children: const [
                            Center(
                                widthFactor: 1.8,
                                heightFactor: 2,
                                child: Text(
                                  'Get Associated with SCL >',
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ))
                          ])
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
                                      primary: _validOTP
                                          ? const Color(0xffFBBC33)
                                          : const Color(0xffcccccc),
                                      onPrimary: const Color(0xff000000),
                                      textStyle: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff000000),
                                      )),
                                  onPressed: () {
                                    if (_validOTP) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage(),
                                        ),
                                      );
                                    }
                                  },
                                  child: const Text('Submit'),
                                ),
                              ),
                            ],
                          ),
                          Row(children: const [
                            Center(
                                widthFactor: 1.8,
                                heightFactor: 2,
                                child: Text(
                                  'Resend OTP in 03:42 mins',
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ))
                          ])
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
