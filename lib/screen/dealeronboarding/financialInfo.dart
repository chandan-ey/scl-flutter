import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../dialog/nomineeDetailsDialog.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
//import 'package:file_picker/file_picker.dart';
import '/screen/dealeronboarding/step1.dart';
import '../dialog/dealerOnboardingSuccessDialog.dart';
import '../../service/states_service.dart';

class FinancialInfo extends StatefulWidget {
  const FinancialInfo({Key? key, required this.parentfunc}) : super(key: key);
  final parentFunctionCallback parentfunc;
  @override
  State<FinancialInfo> createState() => _FinancialInfoState();
}

class _FinancialInfoState extends State<FinancialInfo> {
  String? stateValue;
  bool agree = false;

  final statesService _statesService = statesService();

  @override
  void initState() {
    super.initState();
    // states = _statesService.getState();
    Timer(Duration(seconds: 3), () {
      loadStateDropdown();
    });
  }

  List<DropdownMenuItem<String>> stateMenuItems = [];

  loadStateDropdown() async {
    final post = await _statesService.getState();
    print(post);

    setState(() {
      for (var i = 0; i < post.length; i++) {
        stateMenuItems.add(DropdownMenuItem(
            child: Text(post[i]['name']), value: post[i]['name']));
      }
    });
  }

  pickFiles() async {
    /* FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.any, allowMultiple: false); */
  }

  @override
  Widget build(BuildContext context) {
    return Form(
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
                    'PAN Details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter PAN Details';
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
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: const Text(
                    'GST Details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter GST Details';
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
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: const Text(
                    'State of Registration',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButtonFormField2(
                    decoration: const InputDecoration.collapsed(hintText: ''),
                    isExpanded: true,
                    hint: const Text(
                      'Select State',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                      textAlign: TextAlign.left,
                    ),
                    buttonHeight: 53,
                    buttonWidth: 170,
                    buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      color: Colors.white,
                    ),
                    items: stateMenuItems,
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
                    itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: const Text(
                    'Bank Account Number',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Bank Account Number';
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
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: const Text(
                    'IFSC Code',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter IFSC Code';
                    }
                    return null;
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: const Text(
                    'Nomination Particulars',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                (SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    headingRowColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white),
                    dataRowColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    columns: [
                      DataColumn(label: Text('Nominee Name')),
                      DataColumn(label: Text('Father Name')),
                      DataColumn(label: Text('Relation')),
                      DataColumn(label: Text('PAN No.')),
                      DataColumn(label: Text('Aadhar No.')),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                      ]),
                    ],
                  ),
                )),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const AlertDialog(
                                scrollable: true,
                                content: const NomineeDetailsDialog(),
                              );
                            });
                      },
                      child: Row(
                        children: [
                          Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xffE31E30),
                              ),
                              child: const Text(
                                '+',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              )),
                          const Text(
                            'Add Line',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: const Text(
                    'Upload Documents',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: new InkWell(
                              child: new Text(
                                'Document 1',
                                style: TextStyle(),
                              ),
                              onTap: pickFiles),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: new InkWell(
                              child: new Text(
                                'Document 2',
                                style: TextStyle(),
                              ),
                              onTap: pickFiles),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: new InkWell(
                              child: new Text(
                                'Document 3',
                                style: TextStyle(),
                              ),
                              onTap: pickFiles),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: new InkWell(
                              child: new Text(
                                'Document 4',
                                style: TextStyle(),
                              ),
                              onTap: pickFiles),
                        ),
                      ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => {},
                      child: const Text(
                        'Upload',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xff03A800)),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Checkbox(
                      value: agree,
                      onChanged: (value) {
                        setState(() {
                          agree = value ?? false;
                        });
                      },
                    ),
                    const Text(
                      'I have read and agree to the terms and conditions.',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => {widget.parentfunc(2)},
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
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const AlertDialog(
                            scrollable: true,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0))),
                            content: DealerOnboardingSuccessDialog(),
                          );
                        })
                  },
                  child: const Text(
                    'Submit',
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
}
