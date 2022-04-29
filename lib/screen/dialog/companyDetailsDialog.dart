import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../dealeronboarding/companyDetails.dart';

class CompanyDetailsDialog extends StatefulWidget {
  CompanyDetailsDialog({Key? key, required this.dialogcallback})
      : super(key: key);
  companydialogFunctionCallback dialogcallback;
  @override
  State<CompanyDetailsDialog> createState() => _CompanyDetailsDialog();
}

class _CompanyDetailsDialog extends State<CompanyDetailsDialog> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _director = TextEditingController();
  final TextEditingController _father = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _pan = TextEditingController();
  final TextEditingController _din = TextEditingController();
  final TextEditingController _banker = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Container(
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: const Text(
                    'Director Name',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                TextFormField(
                  controller: _director,
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
                      return 'Please enter director name.';
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
                    'Father\'s Name',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                TextFormField(
                  controller: _father,
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
                      return 'Please enter father\'s name.';
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
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: const Text(
                    'Address',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                TextFormField(
                  controller: _address,
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
                      return 'Please enter address.';
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
                    'PAN No.',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                TextFormField(
                  controller: _pan,
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
                      return 'Please enter PAN No.';
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
                    'DIN No',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                TextFormField(
                  controller: _din,
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
                      return 'Please enter DIN No.';
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
                    'Banker',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                TextFormField(
                  controller: _banker,
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
                      return 'Please enter Banker.';
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
                  margin: const EdgeInsets.all(0),
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true)
                              .pop('dialog');
                        },
                        child: const Text(
                          'CANCEL',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(109, 110, 113, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Map formData = {
                              'nameOfDirector': _director.text,
                              'fathersName': _father.text,
                              'address': _address.text,
                              'panNo': _pan.text,
                              'dinNo': _din.text,
                              'banker': _banker.text,
                              'companyID': '',
                              'uiStatus': 'NEW'
                            };
                            widget.dialogcallback(formData);
                            Navigator.of(context, rootNavigator: true)
                                .pop('dialog');
                          }
                        },
                        child: const Text(
                          'SAVE',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(3, 168, 0, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
