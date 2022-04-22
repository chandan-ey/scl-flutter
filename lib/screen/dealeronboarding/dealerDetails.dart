import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class DealerDetails extends StatefulWidget {
  const DealerDetails({Key? key}) : super(key: key);
  @override
  State<DealerDetails> createState() => _DealerDetailsState();
}

class _DealerDetailsState extends State<DealerDetails> {
  String? cityValue, talukaValue, districtValue, stateValue;
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("USA"), value: "USA"),
      const DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      const DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      const DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItems;
  }

  final _formKey = GlobalKey<FormState>();

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
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(),
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
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Address Line 1',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(fontSize: 18.0, color: Colors.black),
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
                  decoration: const InputDecoration(
                    labelText: 'Address Line 2',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(fontSize: 18.0, color: Colors.black),
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
                          'City',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButtonFormField2(
                          decoration:
                              const InputDecoration.collapsed(hintText: ''),
                          isExpanded: true,
                          hint: const Text(
                            'Select City',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                            textAlign: TextAlign.left,
                          ),
                          buttonHeight: 50,
                          buttonWidth: 170,
                          buttonPadding:
                              const EdgeInsets.only(left: 14, right: 14),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: Colors.black,
                            ),
                            color: Colors.white,
                          ),
                          items: dropdownItems,
                          onChanged: (value) {
                            setState(() {
                              cityValue = value as String;
                            });
                          },
                          value: cityValue,
                          validator: (value) {
                            if (value == null) {
                              return 'Please select city.';
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
                          'Taluka',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButtonFormField2(
                          decoration:
                              const InputDecoration.collapsed(hintText: ''),
                          isExpanded: true,
                          hint: Text(
                            'Select Taluka',
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[500]),
                            textAlign: TextAlign.left,
                          ),
                          buttonHeight: 50,
                          buttonWidth: 170,
                          buttonPadding:
                              const EdgeInsets.only(left: 14, right: 14),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: Colors.black,
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
                          'District',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButtonFormField2(
                          decoration:
                              const InputDecoration.collapsed(hintText: ''),
                          isExpanded: true,
                          hint: const Text(
                            'Select District',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                            textAlign: TextAlign.left,
                          ),
                          buttonHeight: 50,
                          buttonWidth: 170,
                          buttonPadding:
                              const EdgeInsets.only(left: 14, right: 14),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: Colors.black,
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
                          'State',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButtonFormField2(
                          decoration:
                              const InputDecoration.collapsed(hintText: ''),
                          isExpanded: true,
                          hint: Text(
                            'Select State',
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[500]),
                            textAlign: TextAlign.left,
                          ),
                          buttonHeight: 50,
                          buttonWidth: 170,
                          buttonPadding:
                              const EdgeInsets.only(left: 14, right: 14),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: Colors.black,
                            ),
                            color: Colors.white,
                          ),
                          items: dropdownItems,
                          validator: (value) {
                            if (value == null) {
                              return 'Please select state.';
                            }
                          },
                          onChanged: (value) {
                            setState(() {
                              stateValue = value as String;
                            });
                          },
                          value: stateValue,
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
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(),
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
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(fontSize: 18.0, color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email address.';
                    }
                    return null;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')),
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
                    'Contact Number',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(fontSize: 18.0, color: Colors.black),
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
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: const Text('Submit'),
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
