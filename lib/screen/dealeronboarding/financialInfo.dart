import 'dart:async';
import 'package:flutter/material.dart';
import '../dialog/nomineeDetailsDialog.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
//import 'package:file_picker/file_picker.dart';
import '/screen/dealeronboarding/step1.dart';
import '../dialog/dealerOnboardingSuccessDialog.dart';
import '../../service/states_service.dart';

typedef nomineeDialogFunctionCallback = Function(Map nomineerow);

class FinancialInfo extends StatefulWidget {
  const FinancialInfo({Key? key, required this.parentfunc}) : super(key: key);
  final parentFunctionCallback parentfunc;
  @override
  State<FinancialInfo> createState() => _FinancialInfoState();
}

class _FinancialInfoState extends State<FinancialInfo> {
  String panErrMsg = '',
      gstErrMsg = '',
      stateErrMsg = '',
      accountNoErrMsg = '',
      ifscErrMsg = '',
      nominationErrMsg = '',
      documentErrMsg = '',
      acceptErrMsg = '';
  String? stateValue;
  bool agree = false;

  final TextEditingController _panDetails = TextEditingController();
  final TextEditingController _gstDetails = TextEditingController();
  final TextEditingController _accNo = TextEditingController();
  final TextEditingController _ifscCode = TextEditingController();
  List nomineeData = [];

  final statesService _statesService = statesService();

  @override
  void initState() {
    super.initState();
    // states = _statesService.getState();
    panErrMsg = '';
    gstErrMsg = '';
    stateErrMsg = '';
    accountNoErrMsg = '';
    ifscErrMsg = '';
    nominationErrMsg = '';
    documentErrMsg = '';
    acceptErrMsg = '';
    Timer(const Duration(seconds: 3), () {
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
                  controller: _panDetails,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text(
                    panErrMsg,
                    style: TextStyle(color: Colors.red),
                  ),
                )
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
                  controller: _gstDetails,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text(
                    gstErrMsg,
                    style: TextStyle(color: Colors.red),
                  ),
                )
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text(
                    stateErrMsg,
                    style: TextStyle(color: Colors.red),
                  ),
                )
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
                  controller: _accNo,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text(
                    accountNoErrMsg,
                    style: TextStyle(color: Colors.red),
                  ),
                )
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
                  controller: _ifscCode,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text(
                    ifscErrMsg,
                    style: TextStyle(color: Colors.red),
                  ),
                )
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
                    rows: List<DataRow>.generate(
                      nomineeData.length,
                      (int index) => DataRow(
                          color: MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                            // All rows will have the same selected color.
                            if (states.contains(MaterialState.selected)) {
                              return Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.08);
                            }
                            return null; // Use default value for other states and odd rows.
                          }),
                          cells: <DataCell>[
                            DataCell(Text(nomineeData[index]['name'])),
                            DataCell(Text(nomineeData[index]['fathersName'])),
                            DataCell(Text(nomineeData[index]['relation'])),
                            DataCell(Text(nomineeData[index]['panCard'])),
                            DataCell(Text(nomineeData[index]['aadharCard'])),
                          ]),
                    ),
                  ),
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text(
                        nominationErrMsg,
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                scrollable: true,
                                content: NomineeDetailsDialog(
                                  dialogcallback: (Map nomineerow) {
                                    setState(() {
                                      nomineeData.add(nomineerow);
                                    });
                                  },
                                ),
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
                                'Pan_card_document.pdf',
                                style: TextStyle(),
                              ),
                              onTap: pickFiles),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: new InkWell(
                              child: new Text(
                                'gst_2022_file.pdf',
                                style: TextStyle(),
                              ),
                              onTap: pickFiles),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: new InkWell(
                              child: new Text(
                                'blank_checques.pdf',
                                style: TextStyle(),
                              ),
                              onTap: pickFiles),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: new InkWell(
                              child: new Text(
                                'bank_statement_2022.pdf',
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
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text(
                    acceptErrMsg,
                    style: TextStyle(color: Colors.red),
                  ),
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
                    if (isFormValid())
                      {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                scrollable: true,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(32.0))),
                                content: DealerOnboardingSuccessDialog(),
                              );
                            })
                      }
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

  bool isFormValid() {
    bool validFlag = true;
    setState(() {
      panErrMsg = '';
      gstErrMsg = '';
      stateErrMsg = '';
      accountNoErrMsg = '';
      ifscErrMsg = '';
      nominationErrMsg = '';
      documentErrMsg = '';
      acceptErrMsg = '';
    });
    if (_panDetails.text == null || _panDetails.text == '') {
      panErrMsg = 'Please enter Pan Details.';
      validFlag = false;
    }
    if (_gstDetails.text == null || _gstDetails.text == '') {
      gstErrMsg = 'Please enter GST Details.';
      validFlag = false;
    }
    if (stateValue == null || stateValue == '') {
      stateErrMsg = 'Please select state.';
      validFlag = false;
    }
    if (_accNo.text == null || _accNo.text == '') {
      accountNoErrMsg = 'Please select state.';
      validFlag = false;
    }
    if (_ifscCode.text == null || _ifscCode.text == '') {
      ifscErrMsg = 'Please enter IFSC code.';
      validFlag = false;
    }
    if (nomineeData.isEmpty) {
      setState(() {
        nominationErrMsg = 'Please Enter Atleast One Company Details.';
      });
      validFlag = false;
    }
    if (!agree) {
      acceptErrMsg = 'Please accept the terms & Conditions.';
      validFlag = false;
    }
    if (validFlag) {
      return true;
    } else {
      return false;
    }
  }
}
