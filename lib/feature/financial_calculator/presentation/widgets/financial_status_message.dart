import 'package:financial_wellness_app/core/theme/fonts.dart';
import 'package:flutter/material.dart';

class FinancialStatusMessage extends StatelessWidget {
  final String score;
  final String congratulationsMessage;
  final String scoreMessage;

  const FinancialStatusMessage({
    super.key,
    required this.score,
    required this.congratulationsMessage,
    required this.scoreMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          flex: 1,
          child: Text(congratulationsMessage,
              style: titleBlack, textAlign: TextAlign.center),
        ),
        Flexible(
          flex: 1,
          child: Text('$scoreMessage $score',
              style: textGray, textAlign: TextAlign.center),
        ),
      ],
    );
  }
}
