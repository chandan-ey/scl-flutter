import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../dealeronboarding/financialInfo.dart';

class NomineeDetailsDialog extends StatefulWidget {
  NomineeDetailsDialog({Key? key, required this.dialogcallback})
      : super(key: key);
  nomineeDialogFunctionCallback dialogcallback;
  @override
  State<NomineeDetailsDialog> createState() => _NomineeDetailsDialog();
}

class _NomineeDetailsDialog extends State<NomineeDetailsDialog> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomineeName = TextEditingController();
  final TextEditingController _father = TextEditingController();
  final TextEditingController _relation = TextEditingController();
  final TextEditingController _pan = TextEditingController();
  final TextEditingController _aadhar = TextEditingController();

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
                    'Nominee Name',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                TextFormField(
                  controller: _nomineeName,
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
                      return 'Please enter Nominee Name.';
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
                    'Relation',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                TextFormField(
                  controller: _relation,
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
                      return 'Please enter relation.';
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
                    'Aadhar No',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                TextFormField(
                  controller: _aadhar,
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
                      return 'Please enter Aadhar No.';
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
                              'name': _nomineeName.text,
                              'fathersName': _father.text,
                              'relation': _relation.text,
                              'panCard': _pan.text,
                              'aadharCard': _aadhar.text,
                              'nomineeID': '',
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
