import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class BusinessDetails extends StatefulWidget {
  const BusinessDetails({Key? key}) : super(key: key);
  @override
  State<BusinessDetails> createState() => _BusinessDetailsState();
}

class _BusinessDetailsState extends State<BusinessDetails> {
  String? cityValue, talukaValue, districtValue, stateValue;
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("USA"), value: "USA"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Flexible(
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        padding: const EdgeInsets.fromLTRB(2, 14, 0, 10),
                        child: const Text(
                          'Brand Wise Sale',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: const Text(
                            'Choose Brand',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                            textAlign: TextAlign.left,
                          ),
                          buttonHeight: 60,
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
                          itemHeight: 40,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        padding: const EdgeInsets.fromLTRB(2, 14, 0, 10),
                        child: const Text(
                          '',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      DropdownButtonHideUnderline(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: OutlineInputBorder(),
                            labelText: 'Sale in MT',
                          ),
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              //2nd Row for the dropdown
              children: [
                Flexible(
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        padding: const EdgeInsets.fromLTRB(2, 14, 0, 10),
                        // child: const Text(
                        //   '',
                        //   style: TextStyle(fontSize: 20),
                        //   textAlign: TextAlign.left,
                        // ),
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: const Text(
                            'Choose Brand',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                            textAlign: TextAlign.left,
                          ),
                          buttonHeight: 60,
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
                          itemHeight: 40,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        padding: const EdgeInsets.fromLTRB(2, 14, 0, 10),
                        // child: const Text(
                        //   '',
                        //   style: TextStyle(fontSize: 20),
                        //   textAlign: TextAlign.left,
                        // ),
                      ),
                      DropdownButtonHideUnderline(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: OutlineInputBorder(),
                            labelText: 'Sale in MT',
                          ),
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xffE31E30),
                    ),
                    child: Text(
                      '+',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
                Text(
                  'Add New line',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: const Text(
                    'Warehouse Space',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(),
                    labelText: 'Space in sq. feet',
                  ),
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Column(
                    children: [
                      Container(
                        width: 300,
                        padding: const EdgeInsets.fromLTRB(2, 14, 0, 10),
                        child: const Text(
                          'Transportation Assets',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: const Text(
                            'Vehicle Type',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                            textAlign: TextAlign.left,
                          ),
                          buttonHeight: 60,
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
                Flexible(
                  child: Column(
                    children: [
                      Container(
                        width: 190,
                        margin: EdgeInsets.fromLTRB(0, 45, 0, 0),
                        padding: const EdgeInsets.fromLTRB(2, 14, 0, 10),
                      ),
                      DropdownButtonHideUnderline(
                        child: TextFormField(
                          // margin: EdgeInsets.fromLTRB(0,15,0,0),
                          decoration: const InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: OutlineInputBorder(),
                            labelText: 'No. of Vehicles',
                          ),
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xffE31E30),
                    ),
                    child: Text(
                      '+',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
                Text(
                  'Add New line',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
