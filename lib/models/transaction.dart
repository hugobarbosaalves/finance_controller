import 'package:flutter/material.dart';

class Transaction {
  final double value;
  final bool sumOperation;
  final String text;
  final IconData icon;
  final Color colorIcon;
  final Color colorMoney;

  Transaction({
    required this.value,
    required this.sumOperation,
    required this.text,
    required this.icon,
    required this.colorIcon,
    required this.colorMoney,
  });
}
