// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../dialog/companyDetailsDialog.dart';
import '/screen/dealeronboarding/step1.dart';

typedef companydialogFunctionCallback = Function(Map companyrow);

class CompanyDetails extends StatefulWidget {
  const CompanyDetails({Key? key, required this.parentfunc}) : super(key: key);
  final parentFunctionCallback parentfunc;

  @override
  State<CompanyDetails> createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
  bool companyApplicant = true;
  String? statusValue = 'Company';
  String companyErrorMsg = '';
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Company"), value: "Company"),
      const DropdownMenuItem(child: Text("Partnership"), value: "Partnership"),
    ];
    return menuItems;
  }

  List companyData = [];

  List partnerData = [
    {'nameOfPartner': '', 'relation': ''}
  ];

  addItems() {
    setState(() {
      partnerData.add({'nameOfPartner': '', 'relation': ''});
    });
  }

  void _changed(statusValue) {
    setState(() {
      if (statusValue == 'Company') {
        companyApplicant = true;
        partnerData = [
          {'nameOfPartner': '', 'relation': ''}
        ];
      } else {
        companyApplicant = false;
        companyData = [];
      }
      companyErrorMsg = '';
    });
  }

  bool companyDetailsRequest() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Saving Data...')),
    );
    Map formData = {
      'code': null,
      'companies': companyData,
      'partnerships': partnerData,
    };
    print(formData);
    return true;
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
                    'Status of the Applicant',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButtonFormField2(
                    decoration: const InputDecoration.collapsed(hintText: ''),
                    isExpanded: true,
                    hint: Text(
                      'Indicate Company Type',
                      style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                      textAlign: TextAlign.left,
                    ),
                    buttonHeight: 53,
                    // buttonWidth: 360,
                    buttonPadding: const EdgeInsets.only(left: 14, right: 14),
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
                        return 'Please select company type.';
                      }
                    },
                    onChanged: (value) {
                      setState(() {
                        statusValue = value as String;
                        _changed(statusValue);
                      });
                    },
                    value: statusValue,
                    itemHeight: 40,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Visibility(
              visible: companyApplicant,
              child: Column(
                children: [
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
                        borderRadius: BorderRadius.circular(2),
                      ),
                      columns: const [
                        DataColumn(label: Text('Director Name')),
                        DataColumn(label: Text('Father Name')),
                        DataColumn(label: Text('Address')),
                        DataColumn(label: Text('PAN No')),
                        DataColumn(label: Text('DIN No')),
                        DataColumn(label: Text('Banker')),
                      ],
                      rows: List<DataRow>.generate(
                        companyData.length,
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
                              DataCell(
                                  Text(companyData[index]['nameOfDirector'])),
                              DataCell(Text(companyData[index]['fathersName'])),
                              DataCell(Text(companyData[index]['address'])),
                              DataCell(Text(companyData[index]['panNo'])),
                              DataCell(Text(companyData[index]['dinNo'])),
                              DataCell(Text(companyData[index]['banker']))
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
                          companyErrorMsg,
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
                                  content: CompanyDetailsDialog(
                                    dialogcallback: (Map companyrow) {
                                      setState(() {
                                        companyData.add(companyrow);
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
                ],
              ),
              replacement: Column(
                children: [
                  Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: partnerData.length,
                      itemBuilder: (context, index) {
                        return dynamicList(partnerData[index]['nameOfPartner'],
                            partnerData[index]['relation'], index);
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Text(
                          companyErrorMsg,
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: addItems,
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
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => {widget.parentfunc(0)},
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
                        if (companyDetailsRequest())
                          {widget.parentfunc(2)}
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

  Widget dynamicList(partner, relationship, index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: const Text(''),
                // const Text(
                //   '',
                //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                //   textAlign: TextAlign.left,
                // ),
              ),
              TextFormField(
                controller: TextEditingController(text: partner),
                onChanged: (value) =>
                    {updateData(index, value, 'nameOfPartner')},
                decoration: const InputDecoration(
                  labelText: 'Partner Name',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Partner Name.';
                  }
                  return null;
                },
                style: const TextStyle(fontSize: 18.0, color: Colors.black),
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
                width: double.infinity,
                child: const Text(''),
                // const Text(
                //   '',
                //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                //   textAlign: TextAlign.left,
                //),
              ),
              TextFormField(
                controller: TextEditingController(text: relationship),
                onChanged: (value) => {updateData(index, value, 'relation')},
                decoration: const InputDecoration(
                  labelText: 'Relationship',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Relationship.';
                  }
                  return null;
                },
                style: const TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ],
          ),
        ),
      ],
    );
  }

  appendData(Map data) {
    setState(() {
      companyData.add(data);
    });
  }

  updateData(index, value, key) {
    partnerData[index][key] = value;
  }

  bool isFormValid() {
    setState(() {
      companyErrorMsg = '';
    });
    if (companyApplicant) {
      if (companyData.length == 0) {
        setState(() {
          companyErrorMsg = 'Please Enter Atleast One Company Details.';
        });
        return false;
      } else {
        return true;
      }
    } else {
      if (partnerData[0]['nameOfPartner'] == '') {
        setState(() {
          companyErrorMsg = 'Please Enter Atleast One Partner Details.';
        });
        return false;
      }
      for (int i = 0; i < partnerData.length; i++) {
        if (partnerData[i]['nameOfPartner'] != '' &&
            partnerData[i]['relation'] == '') {
          setState(() {
            companyErrorMsg = 'Please Enter Relation Ship for partner.';
          });
          return false;
        }
      }
    }
    return true;
  }
}
