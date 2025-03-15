import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

KeyboardActionsConfig financialStatusConfig(
    FocusNode annualIncomeNode, FocusNode monthlyCostsNode) {
  return KeyboardActionsConfig(
    nextFocus: true, // Move focus to the next field when 'next' is pressed
    keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
    actions: [
      // Action for the Annual Income field
      KeyboardActionsItem(focusNode: annualIncomeNode),

      // Action for the Monthly Costs field
      KeyboardActionsItem(focusNode: monthlyCostsNode),
    ],
  );
}
