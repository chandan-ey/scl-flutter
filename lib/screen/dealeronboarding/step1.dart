import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../drawer/drawer.dart';
import 'package:get/get.dart';
import '../dealeronboarding/dealerDetails.dart';
import '../dealeronboarding/companyDetails.dart';
import '../dealeronboarding/businessDetails.dart';
import '../dealeronboarding/financialInfo.dart';
import '../dialog/dealerOnboardingSuccessDialog.dart';

class OnBoardOnePage extends StatefulWidget {
  const OnBoardOnePage({Key? key}) : super(key: key);

  @override
  State<OnBoardOnePage> createState() => _OnBoardOnePageState();
}

class _OnBoardOnePageState extends State<OnBoardOnePage> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dealeronboarding'.tr,
            style: const TextStyle(
              fontSize: 20,
              fontFamily: 'Roboto',
            )),
        backgroundColor: const Color.fromRGBO(227, 30, 48, 1),
        actions: const [
          IconButton(
            onPressed: null, //() => Navigator.of(context)
            //.push(MaterialPageRoute(builder: (_) => SearchPage())),
            icon: Icon(
              CupertinoIcons.bell_fill,
              color: Color.fromRGBO(255, 255, 255, 0.74),
            ),
          ),
          // Navigate to the Search Screen
          IconButton(
            onPressed: null, //() => Navigator.of(context)
            //.push(MaterialPageRoute(builder: (_) => SearchPage())),
            icon: Icon(
              CupertinoIcons.search,
              color: Color.fromRGBO(255, 255, 255, 0.74),
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              child: Text(
                labelHeading,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              child: Stepper(
                controlsBuilder: (BuildContext context, details) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      onPressed: cancel,
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
                    if (_currentStep < 3)
                      TextButton(
                        onPressed: continued,
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xffE31E30)),
                        ),
                      ),
                    if (_currentStep == 3)
                      TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const AlertDialog(
                                  scrollable: true,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(32.0))),
                                  content: DealerOnboardingSuccessDialog(),
                                );
                              });
                        },
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xffE31E30)),
                        ),
                      ),
                  ],
                ),
                type: stepperType,
                physics: const ScrollPhysics(),
                currentStep: _currentStep,
                onStepTapped: (step) => tapped(step),
                onStepContinue: continued,
                onStepCancel: cancel,
                steps: <Step>[
                  Step(
                    title: new Text(''),
                    content: const DealerDetails(),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text(''),
                    content: const CompanyDetails(),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 1
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text(''),
                    content: const BusinessDetails(),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 2
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text(''),
                    content: const FinancialInfo(),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 3
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: const DrawerPage(),
    );
  }

  String labelHeading = 'Dealer Details';
  tapped(int step) {
    setState(() => _currentStep = step);
  }

  headerLabel(step) {
    if (step == 0) {
      labelHeading = 'Dealer Details';
    } else if (step == 1) {
      labelHeading = 'Company Details';
    } else if (step == 2) {
      labelHeading = 'Business Details';
    } else if (step == 3) {
      labelHeading = 'Financial Information';
    }
  }

  continued() {
    _currentStep < 3 ? setState(() => _currentStep += 1) : null;
    headerLabel(_currentStep);
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
    headerLabel(_currentStep);
  }
}
