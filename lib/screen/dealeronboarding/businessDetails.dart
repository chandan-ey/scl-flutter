import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '/screen/dealeronboarding/step1.dart';

class BusinessDetails extends StatefulWidget {
  const BusinessDetails({Key? key, required this.parentfunc}) : super(key: key);
  final parentFunctionCallback parentfunc;
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

  List brandWiseSaleItems = [
    {'brand': '', 'sale': ''},
    {'brand': '', 'sale': ''}
  ];

  addBrandSaleItems() {
    setState(() {
      brandWiseSaleItems.add({'brand': '', 'sale': ''});
    });
  }

  List vehicleItems = [
    {'type': '', 'count': ''}
  ];

  addVehicleItems() {
    setState(() {
      vehicleItems.add({'type': '', 'count': ''});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(2, 14, 0, 10),
                child: const Text(
                  'Brand Wise Sale',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: brandWiseSaleItems.length,
                itemBuilder: (context, index) {
                  return dynamicBrandList(brandWiseSaleItems[index]['brand'],
                      brandWiseSaleItems[index]['sale']);
                },
              ),
            ),
            Row(
              children: [
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffE31E30),
                    ),
                    child: const Text(
                      '+',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )),
                TextButton(
                  onPressed: addBrandSaleItems,
                  child: const Text(
                    'Add Line',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
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
                    'Warehouse Space',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
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
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter warehouse space.';
                    }
                    return null;
                  },
                ),
              ],
            ),
            Container(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(2, 14, 0, 10),
                child: const Text(
                  'Transportation Assets',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: vehicleItems.length,
                itemBuilder: (context, index) {
                  return dynamicTransportList(vehicleItems[index]['type'],
                      vehicleItems[index]['count']);
                },
              ),
            ),
            Row(
              children: [
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffE31E30),
                    ),
                    child: const Text(
                      '+',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )),
                TextButton(
                  onPressed: addVehicleItems,
                  child: const Text(
                    'Add Line',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => {widget.parentfunc(1)},
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
                  onPressed: () => {widget.parentfunc(3)},
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

  Widget dynamicBrandList(brandName, sale) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: const Text(''),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButtonFormField2(
                  decoration: const InputDecoration.collapsed(hintText: ''),
                  isExpanded: true,
                  hint: const Text(
                    'Choose Brand',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                    textAlign: TextAlign.left,
                  ),
                  buttonHeight: 53,
                  buttonWidth: 170,
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
                  itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                width: double.infinity,
                child: const Text(''),
              ),
              DropdownButtonHideUnderline(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(),
                    labelText: 'Sale in MT',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
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
    );
  }

  Widget dynamicTransportList(vehicleType, count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: const Text(''),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButtonFormField2(
                  decoration: const InputDecoration.collapsed(hintText: ''),
                  isExpanded: true,
                  hint: const Text(
                    'Vehicle Type',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                    textAlign: TextAlign.left,
                  ),
                  buttonHeight: 53,
                  buttonWidth: 170,
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
                  itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                width: double.infinity,
                child: const Text(''),
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
                      vertical: 16.0,
                      horizontal: 10.0,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
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
    );
  }
}
