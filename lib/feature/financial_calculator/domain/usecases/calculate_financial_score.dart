class CalculateFinancialScore {
  String execute(double annualIncome, double monthlyCosts) {
    double annualNetIncome = annualIncome - (annualIncome * 0.08);

    double annualCosts = monthlyCosts * 12;

    if (annualCosts <= (annualNetIncome * 0.25)) {
      return 'HEALTHY';
    } else if (annualCosts <= (annualNetIncome * 0.75)) {
      return 'MEDIUM';
    } else {
      return 'LOW';
    }
  }
}
