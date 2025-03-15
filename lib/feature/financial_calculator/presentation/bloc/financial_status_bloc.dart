import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:financial_wellness_app/feature/financial_calculator/data/repositories/financial_status_repository.dart';
import 'financial_status_event.dart';
import 'financial_status_state.dart';

class FinancialStatusBloc
    extends Bloc<FinancialStatusEvent, FinancialStatusState> {
  final FinancialStatusRepository repository;

  FinancialStatusBloc({required this.repository})
      : super(FinancialStatusInitial()) {
    on<SubmitFinancialDataEvent>((event, emit) async {
      emit(FinancialStatusLoading());

      try {
        final score = repository.getFinancialScore(
            event.annualIncome, event.monthlyCosts);

        emit(FinancialStatusLoaded(score: score));
      } catch (e) {
        emit(FinancialStatusError(message: 'Failed to calculate score: $e'));
      }
    });
  }
}
