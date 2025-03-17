import 'package:flutter/material.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  final double value;
  final Color progressColor;
  final double leftPosition;

  const CustomLinearProgressIndicator({
    super.key,
    required this.value,
    required this.progressColor,
    required this.leftPosition,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: leftPosition,
      child: Container(
        width: 84,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: LinearProgressIndicator(
          borderRadius: BorderRadius.circular(10),
          minHeight: 16,
          value: value,
          color: progressColor,
        ),
      ),
    );
  }
}
