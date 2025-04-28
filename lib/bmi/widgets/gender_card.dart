import 'package:calculator_app/colors.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  const GenderCard(
      {super.key,
      required this.icon,
      required this.label,
      required this.onPressed,
      this.isSelected = false});
  final IconData icon;
  final String label;
  final bool isSelected;
  final Function() onPressed;

  // (x>y)?x:y;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
              color: (isSelected)
                  ? AppColors.primaryColor
                  : AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 80, color: Colors.white),
              const SizedBox(height: 10),
              Text(label, style: const TextStyle(color: Colors.white))
            ],
          ),
        ),
      ),
    );
  }
}
