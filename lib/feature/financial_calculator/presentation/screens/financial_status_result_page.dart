import 'package:financial_wellness_app/core/common/enums.dart';
import 'package:financial_wellness_app/core/common/resource_images.dart';
import 'package:financial_wellness_app/core/theme/colors.dart';
import 'package:financial_wellness_app/core/theme/fonts.dart';
import 'package:financial_wellness_app/feature/financial_calculator/presentation/widgets/custom_button.dart';
import 'package:financial_wellness_app/feature/financial_calculator/presentation/widgets/financial_status_result.dart';
import 'package:financial_wellness_app/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class FinancialStatusResultPage extends StatelessWidget {
  final String score;

  const FinancialStatusResultPage({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 2,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: S.of(context).financialStatusSubTitle1,
                      style: titleBlue,
                    ),
                    TextSpan(
                      text: S.of(context).financialStatusSubTitle2,
                      style: titleBlueBold,
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 5,
              child: Card(
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        flex: 1,
                        child: SvgPicture.asset(
                          logo,
                          width: 48,
                          height: 48,
                        ),
                      ),
                      Flexible(child: FinancialStatusResult(score: score)),
                      Flexible(
                        flex: 2,
                        child: CustomButton(
                          style: CustomButtonStyle.outline,
                          text: 'Return',
                          onPressed: () {
                            context.pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Flexible(
                      child: SvgPicture.asset(
                        lock,
                        width: 24,
                        height: 24,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Text(
                        S.of(context).financialDescription2,
                        style: textGray,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
