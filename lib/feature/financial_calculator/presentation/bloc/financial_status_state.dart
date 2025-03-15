abstract class FinancialStatusState {}

class FinancialStatusInitial extends FinancialStatusState {}

class FinancialStatusLoading extends FinancialStatusState {}

class FinancialStatusLoaded extends FinancialStatusState {
  final String score;

  FinancialStatusLoaded({required this.score});
}

class FinancialStatusError extends FinancialStatusState {
  final String message;

  FinancialStatusError({required this.message});
}
