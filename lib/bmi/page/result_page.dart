import 'package:calculator_app/bmi/page/bmi_calculator_screen.dart';
import 'package:calculator_app/bmi/widgets/custom_buttom.dart';
import 'package:calculator_app/colors.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.result});
  final double result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Result',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            Expanded(
                child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          getClassification(result).toString(),
                          style: const TextStyle(
                              color: Colors.lightGreen,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          result.toStringAsFixed(2),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Your body weight is ${getClassification(result)} Good Job \u{1F44D}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
            CustomButtom(
              buttomName: 'Recalculate',
              height: 100,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BmiCalculatorScreen()));
              },
            )
          ],
        ),
      ),
    );
  }

  String? getClassification(double result) {
    print('Inside Get Class');
    print(result);
    if (result < 18.5) {
      return "Underweight";
    } else if (result > 18.5 && result < 24.9) {
      return "Healthy weight";
    } else if (result > 25 && result < 29.9) {
      return "Overweight but not obese";
    }
    return null;
  }
}
