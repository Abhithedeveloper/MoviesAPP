import 'package:flutter/material.dart';

class SmallChip extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color labelColor;
  final VoidCallback onPressed;

  const SmallChip({
    Key? key,
    required this.label,
    this.backgroundColor = const Color.fromARGB(255, 67, 65, 65),
    this.labelColor = Colors.white,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
        backgroundColor: backgroundColor,
        label: Text(
          label,
          style: TextStyle(color: labelColor),
        ),
     
    );
  }
}
