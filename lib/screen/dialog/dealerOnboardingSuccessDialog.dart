import 'package:flutter/material.dart';
import '../home/home.dart';

class DealerOnboardingSuccessDialog extends StatelessWidget {
  const DealerOnboardingSuccessDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Text(
            'Your Submission has been Successfull!',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff1C1B1F)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Thanks! We have recieved your application and we\'ll be in touch really soon.',
            style: TextStyle(fontSize: 12, color: Color(0xff49454F)),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            child: const Text(
              'Continue',
              style: TextStyle(
                color: Color(0xff03A800),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
