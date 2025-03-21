import 'package:financial_wellness_app/core/utils/keyboard_actions_configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:go_router/go_router.dart';
import 'package:financial_wellness_app/core/common/resource_images.dart';
import 'package:financial_wellness_app/core/theme/colors.dart';
import 'package:financial_wellness_app/core/theme/fonts.dart';
import 'package:financial_wellness_app/core/utils/money_input_formatter.dart';
import 'package:financial_wellness_app/core/utils/validation_methods.dart';
import 'package:financial_wellness_app/feature/financial_calculator/presentation/widgets/custom_button.dart';
import 'package:financial_wellness_app/feature/financial_calculator/presentation/widgets/custom_input_widget.dart';
import 'package:financial_wellness_app/l10n/generated/l10n.dart';
import '../bloc/financial_status_bloc.dart';
import '../bloc/financial_status_event.dart';
import '../bloc/financial_status_state.dart';

class FinancialStatusFormPage extends StatelessWidget {
  final TextEditingController annualIncomeController = TextEditingController();
  final TextEditingController monthlyCostsController = TextEditingController();
  final FocusNode annualIncomeNode = FocusNode();
  final FocusNode monthlyCostsNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FinancialStatusFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                flex: 7,
                child: Card(
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.07,
                            child: SvgPicture.asset(
                              logo,
                              width: 48,
                              height: 48,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.08,
                            child: RichText(
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
                          ),
                          SizedBox(
                            height: size.height * 0.28,
                            child: KeyboardActions(
                              disableScroll: true,
                              config: financialStatusConfig(
                                  annualIncomeNode, monthlyCostsNode),
                              child: Form(
                                key: formKey,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CustomInput(
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8,
                                            right: 4,
                                            top: 8,
                                            bottom: 4),
                                        child: SvgPicture.asset(
                                          dollar,
                                          width: 24,
                                          height: 24,
                                        ),
                                      ),
                                      hintText: "",
                                      inputFieldTitle:
                                          S.of(context).annualIncomeLabel,
                                      controller: annualIncomeController,
                                      keyboardType: TextInputType.number,
                                      focusNode: annualIncomeNode,
                                      inputFormatters: [MoneyInputFormatter()],
                                      validator: (value) => ValidationMethods
                                          .validateAnnualIncome(value),
                                    ),
                                    CustomInput(
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8,
                                            right: 4,
                                            top: 8,
                                            bottom: 4),
                                        child: SvgPicture.asset(
                                          dollar,
                                          width: 24,
                                          height: 24,
                                        ),
                                      ),
                                      hintText: "",
                                      inputFieldTitle:
                                          S.of(context).monthlyCostsLabel,
                                      controller: monthlyCostsController,
                                      keyboardType: TextInputType.number,
                                      focusNode: monthlyCostsNode,
                                      inputFormatters: [MoneyInputFormatter()],
                                      validator: (value) => ValidationMethods
                                          .validateMonthlyCosts(value),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          SizedBox(
                            height: size.height * 0.07,
                            child: CustomButton(
                              text: S.of(context).continueButtonLabel,
                              onPressed: () {
                                if (formKey.currentState?.validate() ?? false) {
                                  final annualIncome = double.tryParse(
                                          annualIncomeController.text
                                              .replaceAll(
                                                  RegExp(r'[^\d]'), '')) ??
                                      0;
                                  final monthlyCosts = double.tryParse(
                                          monthlyCostsController.text
                                              .replaceAll(
                                                  RegExp(r'[^\d]'), '')) ??
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
                          ),
                        ],
                      ),
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
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Text(
                            S.of(context).financialDescription2,
                            style: textGray,
                            textAlign: TextAlign.center,
                          ),
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
