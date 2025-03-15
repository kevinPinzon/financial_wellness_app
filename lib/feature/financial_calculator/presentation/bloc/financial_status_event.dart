abstract class FinancialStatusEvent {}

class SubmitFinancialDataEvent extends FinancialStatusEvent {
  final double annualIncome;
  final double monthlyCosts;

  SubmitFinancialDataEvent(
      {required this.annualIncome, required this.monthlyCosts});
}
