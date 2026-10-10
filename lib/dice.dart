import 'package:flutter/material.dart';

class Dice extends StatelessWidget {
  final int diceValue;

  const Dice({super.key, required this.diceValue});

  @override
  Widget build(BuildContext context) {
    // بنختار الأيقونة بناءً على رقم النرد القادم من البناء (من 1 لـ 6)
    IconData iconData;
    switch (diceValue) {
      case 1:
        iconData = Icons.looks_one;
        break;
      case 2:
        iconData = Icons.looks_two;
        break;
      case 3:
        iconData = Icons.looks_3;
        break;
      case 4:
        iconData = Icons.looks_4;
        break;
      case 5:
        iconData = Icons.looks_5;
        break;
      default:
        iconData = Icons.looks_6;
        break;
    }

    return Icon(
      iconData,
      size: 80,
      color: Colors.white,
    );
  }
}