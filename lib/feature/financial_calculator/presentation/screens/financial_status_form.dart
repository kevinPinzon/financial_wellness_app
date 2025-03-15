import 'package:financial_wellness_app/core/common/resource_images.dart';
import 'package:financial_wellness_app/core/theme/colors.dart';
import 'package:financial_wellness_app/core/theme/fonts.dart';
import 'package:financial_wellness_app/core/utils/keyboard_actions_configs.dart';
import 'package:financial_wellness_app/feature/financial_calculator/presentation/widgets/custom_button.dart';
import 'package:financial_wellness_app/feature/financial_calculator/presentation/widgets/custom_input_widget.dart';
import 'package:financial_wellness_app/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import '../bloc/financial_status_bloc.dart';
import '../bloc/financial_status_event.dart';
import '../bloc/financial_status_state.dart';
import 'package:financial_wellness_app/core/utils/validation_methods.dart'; // Import validation methods

class FinancialStatusFormPage extends StatelessWidget {
  final TextEditingController annualIncomeController = TextEditingController();
  final TextEditingController monthlyCostsController = TextEditingController();
  final FocusNode annualIncomeNode = FocusNode();
  final FocusNode monthlyCostsNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                        KeyboardActions(
                          disableScroll: true,
                          config: financialStatusConfig(
                              annualIncomeNode, monthlyCostsNode),
                          child: Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomInput(
                                  hintText: "\$",
                                  inputFieldTitle:
                                      S.of(context).annualIncomeLabel,
                                  controller: annualIncomeController,
                                  keyboardType: TextInputType.number,
                                  focusNode: annualIncomeNode,
                                  validator: (value) =>
                                      ValidationMethods.validateAnnualIncome(
                                          value),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomInput(
                                  hintText: "\$",
                                  inputFieldTitle:
                                      S.of(context).monthlyCostsLabel,
                                  controller: monthlyCostsController,
                                  keyboardType: TextInputType.number,
                                  focusNode: monthlyCostsNode,
                                  validator: (value) =>
                                      ValidationMethods.validateMonthlyCosts(
                                          value),
                                ),
                              ],
                            ),
                          ),
                        ),
                        CustomButton(
                          text: S.of(context).continueButtonLabel,
                          onPressed: () {
                            if (formKey.currentState?.validate() ?? false) {
                              final annualIncome = double.tryParse(
                                      annualIncomeController.text) ??
                                  0;
                              final monthlyCosts = double.tryParse(
                                      monthlyCostsController.text) ??
                                  0;

                              context.read<FinancialStatusBloc>().add(
                                    SubmitFinancialDataEvent(
                                      annualIncome: annualIncome,
                                      monthlyCosts: monthlyCosts,
                                    ),
                                  );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          lock,
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          S.of(context).financialDescription2,
                          style: textGray,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
