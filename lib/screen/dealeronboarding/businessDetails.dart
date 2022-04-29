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
  String brandErrorMsg = '';
  String? brandName, vehicleType;

  static List<String> BrandItems = ['Brand1', 'Brand2', 'Brand3'];
  static var seen = Set<String>();
  List<String> BrandItemslist =
      BrandItems.where((element) => seen.add(element)).toList();

  static List<String> VehicleDetailItems = ['car', 'bus', 'truck'];
  List<String> VehicleItemslist =
      VehicleDetailItems.where((element) => seen.add(element)).toList();

  final TextEditingController _warehouseSpace = TextEditingController();

  List brandWiseSaleItems = [
    {'brandCode': '', 'saleInMT': ''}
  ];

  addBrandSaleItems() {
    setState(() {
      brandWiseSaleItems.add({'brandCode': '', 'saleInMT': ''});
    });
  }

  List vehicleItems = [
    {'vehicleType': '', 'noOfVehicles': ''}
  ];

  addVehicleItems() {
    setState(() {
      vehicleItems.add({'vehicleType': '', 'noOfVehicles': ''});
    });
  }

  bool businessDetailsRequest() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Saving Data...')),
    );
    Map formData = {
      'code': null,
      'brandWiseSale': brandWiseSaleItems,
      'storage': vehicleItems,
      'warehouseSpace': _warehouseSpace.text,
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
            Container(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(2, 14, 0, 10),
                child: const Text(
                  'Monthly Brand Wise Sale',
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
                  return dynamicBrandList(
                      brandWiseSaleItems[index]['brandCode'],
                      brandWiseSaleItems[index]['saleInMT'],
                      index);
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
                    'Warehouse Capacity',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _warehouseSpace,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(),
                    labelText: 'Qty in MT that can be stored',
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
                      return 'Please enter warehouse capacity.';
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
                  return dynamicTransportList(
                      vehicleItems[index]['vehicleType'],
                      vehicleItems[index]['noOfVehicles'],
                      index);
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
                  onPressed: () => {
                    if (isFormValid())
                      {
                        if (businessDetailsRequest())
                          {widget.parentfunc(3)}
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

  Widget dynamicBrandList(brandName, sale, index) {
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
                  onChanged: (value) =>
                      {updateBrandData(index, value, 'brandCode')},
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
                  validator: (value) {
                    if (value == null) {
                      return 'Please select Brand.';
                    }
                  },
                  value: BrandItemslist[getUniqueValue(
                      brandWiseSaleItems[index]['brandCode'], BrandItems)],
                  items: BrandItemslist.map((e) {
                    return DropdownMenuItem(
                      child: Text(e),
                      value: e,
                    );
                  }).toList(),
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
                  controller: TextEditingController(
                      text: brandWiseSaleItems[index]['saleInMT']),
                  keyboardType: TextInputType.number,
                  onChanged: (value) =>
                      {updateBrandData(index, value, 'saleInMT')},
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

  Widget dynamicTransportList(vehicleType, count, index) {
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
                  onChanged: (value) =>
                      {updateVehicleData(index, value, 'vehicleType')},
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
                  value: VehicleItemslist[getUniqueValue(
                      vehicleItems[index]['vehicleType'], VehicleDetailItems)],
                  items: VehicleItemslist.map((e) {
                    return DropdownMenuItem(
                      child: Text(e),
                      value: e,
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select vehicle type.';
                    }
                  },
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
                  controller: TextEditingController(
                      text: vehicleItems[index]['noOfVehicles']),
                  onChanged: (value) =>
                      {updateVehicleData(index, value, 'noOfVehicles')},
                  keyboardType: TextInputType.number,
                  // margin: EdgeInsets.fromLTRB(0,15,0,0),
                  decoration: const InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(),
                    labelText: 'Number of Vehicles',
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
                      return 'Please enter number of vehicles.';
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

  appendBrandData(Map data) {
    setState(() {
      brandWiseSaleItems.add(data);
    });
  }

  updateBrandData(index, value, key) {
    brandWiseSaleItems[index][key] = value;
  }

  getUniqueValue(String value, List list) {
    for (var i = 0; i < list.length; i++) {
      if (list[i] == value) {
        return i;
      }
    }
    return 0;
  }

  appendVehicleData(Map data) {
    setState(() {
      vehicleItems.add(data);
    });
  }

  updateVehicleData(index, value, key) {
    vehicleItems[index][key] = value;
  }

  bool isFormValid() {
    setState(() {
      brandErrorMsg = '';
    });
    return true;
  }
}
