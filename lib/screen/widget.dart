import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final bool isActive;
  const Indicator({super.key, required this.isActive});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 7,
      width: 7,
      decoration: BoxDecoration(
        color: isActive
          ? Colors.white
          : Colors.grey,
        borderRadius: BorderRadius.circular(12)
      ),
    );
  }
}