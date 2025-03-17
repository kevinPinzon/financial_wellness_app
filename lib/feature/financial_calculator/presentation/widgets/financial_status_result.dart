// ignore_for_file: constant_identifier_names

import 'package:financial_wellness_app/core/theme/colors.dart';
import 'package:financial_wellness_app/feature/financial_calculator/presentation/widgets/custom_linear_progress_indicator.dart';
import 'package:financial_wellness_app/feature/financial_calculator/presentation/widgets/financial_status_message.dart';
import 'package:financial_wellness_app/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';

const String HEALTHY = "HEALTHY";
const String MEDIUM = "MEDIUM";
const String LOW = "LOW";

class FinancialStatusResult extends StatelessWidget {
  final String score;

  const FinancialStatusResult({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color progressColor1 = getProgressColor(score, 3);
    Color progressColor2 = getProgressColor(score, 2);
    Color progressColor3 = getProgressColor(score, 1);

    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Center(
            child: Stack(
              children: [
                CustomLinearProgressIndicator(
                  value: 1,
                  progressColor: progressColor1,
                  leftPosition: size.width * 0.47,
                ),
                CustomLinearProgressIndicator(
                  value: 1,
                  progressColor: progressColor2,
                  leftPosition: size.width * 0.29,
                ),
                CustomLinearProgressIndicator(
                  value: 1,
                  progressColor: progressColor3,
                  leftPosition: size.width * 0.10,
                ),
              ],
            ),
          ),
        ),
        Flexible(
          child: FinancialStatusMessage(
            score: score,
            congratulationsMessage: _getCongratulationsMessage(score, context),
            scoreMessage: _getScoreDescription(score, context),
          ),
        ),
      ],
    );
  }

  String _getCongratulationsMessage(String score, BuildContext context) {
    switch (score) {
      case HEALTHY:
        return S.of(context).financialTitleHealthy;
      case MEDIUM:
        return S.of(context).financialTitleMedium;
      case LOW:
        return S.of(context).financialTitleLow;
      default:
        return 'Unknown Score';
    }
  }

  String _getScoreDescription(String score, BuildContext context) {
    switch (score) {
      case HEALTHY:
        return S.of(context).financialDescriptionHealthy;
      case MEDIUM:
        return S.of(context).financialDescriptionMedium;
      case LOW:
        return S.of(context).financialDescriptionLow;
      default:
        return 'Unknown Score';
    }
  }

  Color getProgressColor(String score, int barIndex) {
    Color baseColor = _getBaseColor(score);

    if (barIndex == 1) {
      return baseColor;
    } else if (barIndex == 2) {
      return score == LOW ? AppColors.gray : baseColor;
    } else {
      return (score == LOW || score == MEDIUM) ? AppColors.gray : baseColor;
    }
  }

  Color _getBaseColor(String score) {
    switch (score) {
      case HEALTHY:
        return AppColors.green;
      case MEDIUM:
        return AppColors.yellow;
      default:
        return AppColors.red;
    }
  }
}
