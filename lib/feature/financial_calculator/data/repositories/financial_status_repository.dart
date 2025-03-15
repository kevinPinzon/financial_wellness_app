import 'package:financial_wellness_app/feature/financial_calculator/domain/usecases/calculate_financial_score.dart';

class FinancialStatusRepository {
  final CalculateFinancialScore calculateFinancialScore;

  FinancialStatusRepository({required this.calculateFinancialScore});

  String getFinancialScore(double annualIncome, double monthlyCosts) {
    return calculateFinancialScore.execute(annualIncome, monthlyCosts);
  }
}
