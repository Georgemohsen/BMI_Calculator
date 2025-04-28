import 'package:calculator_app/colors.dart';
import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom(
      {super.key,
      required this.buttomName,
      required this.onPressed,
      required this.height});
  final String buttomName;
  final Function() onPressed;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: height,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: onPressed,
            child: Text(buttomName,
                style: const TextStyle(fontSize: 16, color: Colors.white))));
  }
}
