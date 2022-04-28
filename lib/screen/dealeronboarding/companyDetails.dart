import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../dialog/companyDetailsDialog.dart';
import '/screen/dealeronboarding/step1.dart';

class CompanyDetails extends StatefulWidget {
  const CompanyDetails({Key? key, required this.parentfunc}) : super(key: key);
  final parentFunctionCallback parentfunc;

  @override
  State<CompanyDetails> createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
  bool companyApplicant = true;
  String? statusValue = 'Company';
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Company"), value: "Company"),
      const DropdownMenuItem(child: Text("Partnership"), value: "Partnership"),
    ];
    return menuItems;
  }

  List items = [
    {'company': '', 'partner': ''}
  ];

  addItems() {
    print(items);
    setState(() {
      items.add({'company': '', 'partner': ''});
    });
  }

  void _changed(statusValue) {
    setState(() {
      if (statusValue == 'Company') {
        companyApplicant = true;
      } else {
        companyApplicant = false;
      }
    });
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
                      rows: const [
                        DataRow(cells: [
                          DataCell(Text('')),
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
                          DataCell(Text('')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('')),
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
                                  content: const CompanyDetailsDialog(),
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
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return dynamicList(
                            items[index]['company'], items[index]['partner']);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const AlertDialog(
                                  scrollable: true,
                                  content: const CompanyDetailsDialog(),
                                );
                              });
                        },
                        child: Row(
                          children: [
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                            TextButton(
                              onPressed: addItems,
                              child: const Text(
                                'Add Line',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                              ),
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
                  onPressed: () => {widget.parentfunc(2)},
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

  Widget dynamicList(company, partner) {
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
                controller: TextEditingController(text: company),
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
                controller: TextEditingController(text: partner),
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
}
