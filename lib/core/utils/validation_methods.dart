class ValidationMethods {
  // Validate Annual Income
  static String? validateAnnualIncome(String? value) {
    if (value == null || value.isEmpty) {
      return "Annual income is required";
    }
    final income = double.tryParse(value);
    if (income == null || income <= 0) {
      return "Please enter a valid annual income";
    }
    return null;
  }

  // Validate Monthly Costs
  static String? validateMonthlyCosts(String? value) {
    if (value == null || value.isEmpty) {
      return "Monthly costs are required";
    }
    final costs = double.tryParse(value);
    if (costs == null || costs <= 0) {
      return "Please enter valid monthly costs";
    }
    return null;
  }
}
