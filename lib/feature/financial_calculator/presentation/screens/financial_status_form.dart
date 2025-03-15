import 'package:financial_wellness_app/core/common/resource_images.dart';
import 'package:financial_wellness_app/core/theme/colors.dart';
import 'package:financial_wellness_app/core/theme/fonts.dart';
import 'package:financial_wellness_app/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../bloc/financial_status_bloc.dart';
import '../bloc/financial_status_event.dart';
import '../bloc/financial_status_state.dart';

class FinancialStatusFormPage extends StatelessWidget {
  final TextEditingController annualIncomeController = TextEditingController();
  final TextEditingController monthlyCostsController = TextEditingController();

  FinancialStatusFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<FinancialStatusBloc, FinancialStatusState>(
        listener: (context, state) {
          if (state is FinancialStatusLoaded) {
            // Navigate to the result screen with the calculated score
            context.go('/home/result/${state.score}');
          } else if (state is FinancialStatusError) {
            // Show error
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                flex: 1,
                child: SvgPicture.asset(
                  kalshiLogoBlack,
                  width: 76,
                  height: 20,
                ),
              ),
              Flexible(
                flex: 1,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: S.of(context).financialTitlePart1,
                        style: titleBlue,
                      ),
                      TextSpan(
                        text: S.of(context).financialTitlePart2,
                        style: titleBlueBold,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Card(
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          logo,
                          width: 48,
                          height: 48,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: S.of(context).financialSubTitle,
                                style: titleBlack,
                              ),
                              TextSpan(
                                text: S.of(context).financialDescription,
                                style: textGray,
                              )
                            ],
                          ),
                        ),
                        TextField(
                          controller: annualIncomeController,
                          decoration: InputDecoration(
                            labelText: S.of(context).annualIncomeLabel,
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          controller: monthlyCostsController,
                          decoration: InputDecoration(
                            labelText: S.of(context).monthlyCostsLabel,
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            final annualIncome =
                                double.tryParse(annualIncomeController.text) ??
                                    0;
                            final monthlyCosts =
                                double.tryParse(monthlyCostsController.text) ??
                                    0;

                            if (annualIncome > 0 && monthlyCosts > 0) {
                              context.read<FinancialStatusBloc>().add(
                                    SubmitFinancialDataEvent(
                                      annualIncome: annualIncome,
                                      monthlyCosts: monthlyCosts,
                                    ),
                                  );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        S.of(context).invalidValuesMessage)),
                              );
                            }
                          },
                          child: Text(S.of(context).continueButtonLabel),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Flexible(flex: 2, child: Placeholder())
            ],
          ),
        ),
      ),
    );
  }
}
