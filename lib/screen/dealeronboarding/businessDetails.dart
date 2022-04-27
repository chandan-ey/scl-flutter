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
                        child: DropdownButtonFormField2(
                          decoration:
                              const InputDecoration.collapsed(hintText: ''),
                          isExpanded: true,
                          hint: const Text(
                            'Choose Brand',
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
                              color: Colors.black,
                            ),
                            color: Colors.white,
                          ),
                          items: dropdownItems,
                          validator: (value) {
                            if (value == null) {
                              return 'Please select Brand.';
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
                          '',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      DropdownButtonHideUnderline(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: OutlineInputBorder(),
                            labelText: 'Sale in MT',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 10.0),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: TextStyle(fontSize: 16.0, color: Colors.black),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter sale MT details.';
                            }
                            return null;
                          },
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
                        child: DropdownButtonFormField2(
                          decoration:
                              const InputDecoration.collapsed(hintText: ''),
                          isExpanded: true,
                          hint: const Text(
                            'Choose Brand',
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
                              color: Colors.black,
                            ),
                            color: Colors.white,
                          ),
                          items: dropdownItems,
                          validator: (value) {
                            if (value == null) {
                              return 'Please select Brand.';
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
                const SizedBox(
                  width: 10,
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
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: OutlineInputBorder(),
                            labelText: 'Sale in MT',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 10.0),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: TextStyle(fontSize: 16.0, color: Colors.black),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter sale MT details.';
                            }
                            return null;
                          },
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
                    margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
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
                  'Add Line',
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
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(),
                    labelText: 'Space in sq. feet',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter warehouse space.';
                    }
                    return null;
                  },
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(2, 14, 0, 10),
                        child: const Text(
                          'Transportation Assets',
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
                            'Vehicle Type',
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
                              color: Colors.black,
                            ),
                            color: Colors.white,
                          ),
                          items: dropdownItems,
                          validator: (value) {
                            if (value == null) {
                              return 'Please select vehicle type.';
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
                        margin: const EdgeInsets.fromLTRB(0, 45, 0, 0),
                        padding: const EdgeInsets.fromLTRB(2, 14, 0, 10),
                      ),
                      DropdownButtonHideUnderline(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          // margin: EdgeInsets.fromLTRB(0,15,0,0),
                          decoration: const InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: OutlineInputBorder(),
                            labelText: 'No. of Vehicles',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 10.0),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: TextStyle(fontSize: 16.0, color: Colors.black),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter no. of vehicles.';
                            }
                            return null;
                          },
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
                    margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xffE31E30),
                    ),
                    child: const Text(
                      '+',
                      style: TextStyle(fontSize: 20, color: Colors.white),
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
          ],
        ),
      ),
    );
  }
}
