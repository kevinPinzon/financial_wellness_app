import 'package:financial_wellness_app/core/common/enums.dart';
import 'package:financial_wellness_app/core/common/resource_images.dart';
import 'package:financial_wellness_app/core/theme/colors.dart';
import 'package:financial_wellness_app/core/theme/fonts.dart';
import 'package:financial_wellness_app/feature/financial_calculator/presentation/screens/financial_status_form.dart';
import 'package:financial_wellness_app/feature/financial_calculator/presentation/widgets/custom_button.dart';
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
                      text: "Here's your ",
                      style: titleBlue,
                    ),
                    TextSpan(
                      text: "financial wellness score.",
                      style: titleBlueBold,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Card(
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Flexible(
                        child: SvgPicture.asset(
                          logo,
                          width: 48,
                          height: 48,
                        ),
                      ),
                      Flexible(
                        child: Text('Congratulations!',
                            style: titleBlack, textAlign: TextAlign.center),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              child: LinearProgressIndicator(
                                borderRadius: BorderRadius.circular(10),
                                minHeight: 16,
                                value: 1,
                                color: AppColors.green,
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              width: 100,
                              child: LinearProgressIndicator(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  topLeft: Radius.elliptical(10, 100),
                                  bottomLeft: Radius.elliptical(10, 100),
                                ),
                                minHeight: 16,
                                value: 1,
                                color: AppColors.green,
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              width: 100,
                              child: LinearProgressIndicator(
                                minHeight: 16,
                                value: 1,
                                color: AppColors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Text('${S.of(context).scoreMessage} $score',
                            style: titleBlack, textAlign: TextAlign.center),
                      ),
                      Flexible(
                        child: CustomButton(
                            style: CustomButtonStyle.outline,
                            text: 'Return',
                            onPressed: () {
                              context.pop();
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
