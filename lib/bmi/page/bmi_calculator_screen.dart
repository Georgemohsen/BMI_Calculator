import 'package:calculator_app/bmi/page/result_page.dart';
import 'package:calculator_app/bmi/widgets/custom_buttom.dart';
import 'package:calculator_app/bmi/widgets/gender_card.dart';
import 'package:calculator_app/colors.dart';
import 'package:flutter/material.dart';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {
  bool isMale = true;
  double height = 160;
  int weight = 50;
  int age = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text('BMI Calculator',
            style: TextStyle(fontSize: 20, color: Colors.white)),
        leading: const Icon(
          Icons.sports_gymnastics,
          color: Colors.amberAccent,
          size: 30,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            genderType(),
            const SizedBox(height: 10),
            heightUi(),
            const SizedBox(height: 10),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration:
                        const BoxDecoration(color: AppColors.secondaryColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Weight',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          weight.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              style: IconButton.styleFrom(
                                  backgroundColor: AppColors.greyColor),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            IconButton(
                              style: IconButton.styleFrom(
                                  backgroundColor: AppColors.greyColor),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    decoration:
                        const BoxDecoration(color: AppColors.secondaryColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Age',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          age.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              style: IconButton.styleFrom(
                                  backgroundColor: AppColors.greyColor),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            IconButton(
                              style: IconButton.styleFrom(
                                  backgroundColor: AppColors.greyColor),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
            const SizedBox(height: 10),
            CustomButtom(
              buttomName: "Calculate",
              height: 50,
              onPressed: () {
                double result = weight / (height / 100 * height / 100);
                print(result);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultScreen(result: result)));
              },
            ),
          ],
        ),
      ),
    );
  }

  Expanded heightUi() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xff1d1e33),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Height', style: TextStyle(color: Colors.white)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(height.toStringAsFixed(0),
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const Text('cm', style: TextStyle(color: Colors.white)),
              ],
            ),
            Slider(
              value: height,
              min: 80,
              max: 220,
              activeColor: AppColors.primaryColor,
              inactiveColor: AppColors.greyColor,
              thumbColor: AppColors.primaryColor,
              onChanged: (value) {
                setState(() {
                  height = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }

  Expanded genderType() {
    return Expanded(
      child: Row(
        children: [
          GenderCard(
            icon: Icons.male,
            label: 'Male',
            onPressed: () {
              setState(() {
                isMale = true;
              });
            },
            isSelected: isMale,
          ),
          const SizedBox(width: 10),
          GenderCard(
            icon: Icons.female,
            label: 'Female',
            onPressed: () {
              setState(() {
                isMale = false;
              });
            },
            isSelected: !isMale,
          )
        ],
      ),
    );
  }
}
