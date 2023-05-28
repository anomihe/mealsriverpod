import 'package:flutter/material.dart';
import 'package:mealsprovider/screens/categories.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({
    required this.icon,
    required this.label,
    super.key,
  });
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 17,
          color: Colors.white,
        ),
        6.0.width,
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
