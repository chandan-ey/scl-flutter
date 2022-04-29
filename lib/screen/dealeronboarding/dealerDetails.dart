import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:scl_android/screen/dealeronboarding/step1.dart';
import '../../service/states_service.dart';

class DealerDetails extends StatefulWidget {
  DealerDetails({Key? key, required this.parentfunc}) : super(key: key);
  final parentFunctionCallback parentfunc;
  @override
  State<DealerDetails> createState() => _DealerDetailsState();
}

class _DealerDetailsState extends State<DealerDetails> {
  String? cityValue, talukaValue, districtValue, stateValue;
  //late String _password1;
  //double _strength = 0;

  final statesService _statesService = statesService();

  List states = [];
  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");

  //String _displayText = 'Please enter a password';

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("USA"), value: "USA"),
      const DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      const DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      const DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItems;
  }

  final TextEditingController _dealerName = TextEditingController();
  final TextEditingController _addressLine1 = TextEditingController();
  final TextEditingController _addressLine2 = TextEditingController();
  final TextEditingController _pincode = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _contactnumber = TextEditingController();
  final TextEditingController _referralcode = TextEditingController();
  //final TextEditingController _password = TextEditingController();
  //final TextEditingController _confirmPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // states = _statesService.getState();
    Timer(Duration(seconds: 3), () {
      print("Yeah, this line is printed after 3 seconds");
    });
  }

  bool dealerFormDetails() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Saving Data...')),
    );
    Map formData = {
      'name': _dealerName.text,
      'line1': _addressLine1.text,
      'line2': _addressLine2.text,
      'pinCode': _pincode.text,
      'email': _email.text,
      'mobileNo': _contactnumber.text,
      'referralCode': _referralcode.text,
      'stateCode': stateValue,
      'districtCode': districtValue,
      'talukaCode': talukaValue,
      'cityCode': cityValue
    };
    print(formData);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: const Text(
                    'Dealer Name',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  controller: _dealerName,
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  style: const TextStyle(fontSize: 18.0, color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter dealer name.';
                    }
                    return null;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: const Text(
                    'Business Address',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  controller: _addressLine1,
                  decoration: const InputDecoration(
                    labelText: 'Address Line 1',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  style: const TextStyle(fontSize: 16.0, color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter address line 1.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  controller: _addressLine2,
                  decoration: const InputDecoration(
                    labelText: 'Address Line 2',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  style: const TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        padding: const EdgeInsets.fromLTRB(2, 14, 0, 10),
                        child: const Text(
                          'State',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButtonFormField2(
                          decoration:
                              const InputDecoration.collapsed(hintText: ''),
                          isExpanded: true,
                          hint: const Text(
                            'Select State',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                            textAlign: TextAlign.left,
                          ),
                          buttonHeight: 53,
                          buttonWidth: 170,
                          buttonPadding:
                              const EdgeInsets.only(left: 14, right: 14),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            color: Colors.white,
                          ),
                          items: dropdownItems,
                          onChanged: (value) {
                            setState(() {
                              stateValue = value as String;
                            });
                          },
                          value: stateValue,
                          validator: (value) {
                            if (value == null) {
                              return 'Please select state.';
                            }
                          },
                          itemHeight: 40,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        padding: const EdgeInsets.fromLTRB(2, 14, 0, 10),
                        child: const Text(
                          'District',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButtonFormField2(
                          decoration:
                              const InputDecoration.collapsed(hintText: ''),
                          isExpanded: true,
                          hint: Text(
                            'Select District',
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[500]),
                            textAlign: TextAlign.left,
                          ),
                          buttonHeight: 53,
                          buttonWidth: 170,
                          buttonPadding:
                              const EdgeInsets.only(left: 14, right: 14),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            color: Colors.white,
                          ),
                          items: dropdownItems,
                          validator: (value) {
                            if (value == null) {
                              return 'Please select district.';
                            }
                          },
                          onChanged: (value) {
                            setState(() {
                              districtValue = value as String;
                            });
                          },
                          value: districtValue,
                          itemHeight: 40,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Column(
                    children: [
                      Container(
                        width: 220,
                        padding: const EdgeInsets.fromLTRB(2, 14, 0, 10),
                        child: const Text(
                          'Taluka',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButtonFormField2(
                          decoration:
                              const InputDecoration.collapsed(hintText: ''),
                          isExpanded: true,
                          hint: const Text(
                            'Select Taluka',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                            textAlign: TextAlign.left,
                          ),
                          buttonHeight: 53,
                          buttonWidth: 170,
                          buttonPadding:
                              const EdgeInsets.only(left: 14, right: 14),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            color: Colors.white,
                          ),
                          items: dropdownItems,
                          validator: (value) {
                            if (value == null) {
                              return 'Please select taluka.';
                            }
                          },
                          onChanged: (value) {
                            setState(() {
                              talukaValue = value as String;
                            });
                          },
                          value: talukaValue,
                          itemHeight: 40,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Column(
                    children: [
                      Container(
                        width: 190,
                        padding: const EdgeInsets.fromLTRB(2, 14, 0, 10),
                        child: const Text(
                          'City',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButtonFormField2(
                          decoration:
                              const InputDecoration.collapsed(hintText: ''),
                          isExpanded: true,
                          hint: Text(
                            'Select City',
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[500]),
                            textAlign: TextAlign.left,
                          ),
                          buttonHeight: 53,
                          buttonWidth: 170,
                          buttonPadding:
                              const EdgeInsets.only(left: 14, right: 14),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            color: Colors.white,
                          ),
                          items: dropdownItems,
                          validator: (value) {
                            if (value == null) {
                              return 'Please select city.';
                            }
                          },
                          onChanged: (value) {
                            setState(() {
                              cityValue = value as String;
                            });
                          },
                          value: cityValue,
                          itemHeight: 40,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: const Text(
                    'Pin Code',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  controller: _pincode,
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  style: const TextStyle(fontSize: 18.0, color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter pin code.';
                    }
                    return null;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: const Text(
                    'Email Address',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  style: const TextStyle(fontSize: 16.0, color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email address.';
                    } else if (!_isEmailValid(value)) {
                      return 'Please enter valid email address.';
                    }
                    return null;
                  },
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: const Text(
                    'Contact Number',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  controller: _contactnumber,
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  style: const TextStyle(fontSize: 16.0, color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter contact number.';
                    }
                    return null;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: const Text(
                    'Referral Code (If Any)',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  controller: _referralcode,
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  style: const TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ],
            ),
            /* Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: const Text(
                    'Password',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  controller: _password,
                  onChanged: (value) => _checkPassword(value),
                  obscureText: true,
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  style: const TextStyle(fontSize: 16.0, color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Password.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                LinearProgressIndicator(
                  value: _strength,
                  backgroundColor: Colors.grey[300],
                  color: _strength <= 1 / 4
                      ? Colors.red
                      : _strength == 2 / 4
                          ? Colors.yellow
                          : _strength == 3 / 4
                              ? Colors.blue
                              : Colors.green,
                  minHeight: 5,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(_displayText, style: const TextStyle(fontSize: 18)),
              ],
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: const Text(
                    'Confirm Password',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  controller: _confirmPassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  style: const TextStyle(fontSize: 16.0, color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter confirm password.';
                    } else if (value != _password.text) {
                      return 'Password does not Match.';
                    }
                    return null;
                  },
                ),
              ],
            ), */
            Column(
              children: [
                Container(
                  width: 200,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xffFBBC33),
                        onPrimary: const Color(0xff000000),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    onPressed: () {
                      print(_statesService.getState());
                    },
                    child: const Text('Generate OTP'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => {},
                  child: const Text(
                    'Back',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff6D6E71)),
                  ),
                ),
                TextButton(
                  onPressed: () => {
                    // Validate returns true if the form is valid, or false otherwise.
                    //dealerFormDetails(),
                    if (_formKey.currentState!.validate())
                      {
                        if (dealerFormDetails())
                          {widget.parentfunc(1)}
                        else
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Server Error! Please Try Again.')),
                            )
                          }
                      }
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xffE31E30)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  bool _isEmailValid(String value) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    return emailValid;
  }

  /* void _checkPassword(String value) {
    _password1 = value.trim();

    if (_password1.isEmpty) {
      setState(() {
        _strength = 0;
        _displayText = 'Please enter your password';
      });
    } else if (_password1.length < 6) {
      setState(() {
        _strength = 1 / 4;
        _displayText = 'Your password is too short';
      });
    } else if (_password1.length < 8) {
      setState(() {
        _strength = 2 / 4;
        _displayText = 'Your password strength is moderate';
      });
    } else {
      if (!letterReg.hasMatch(_password1) || !numReg.hasMatch(_password1)) {
        setState(() {
          _strength = 3 / 4;
          _displayText = 'Your password is strong';
        });
      } else {
        setState(() {
          _strength = 1;
          _displayText = 'Your password is great';
        });
      }
    }
  } */
}

mixin async {}
