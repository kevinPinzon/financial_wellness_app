import 'package:get_it/get_it.dart';
import 'package:financial_wellness_app/feature/financial_calculator/data/repositories/financial_status_repository.dart';
import 'package:financial_wellness_app/feature/financial_calculator/domain/usecases/calculate_financial_score.dart';
import 'package:financial_wellness_app/feature/financial_calculator/presentation/bloc/financial_status_bloc.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  // Register use case
  getIt.registerLazySingleton(() => CalculateFinancialScore());

  // Register repository
  getIt.registerLazySingleton(() => FinancialStatusRepository(
        calculateFinancialScore: getIt(),
      ));

  // Register BLoC
  getIt.registerFactory(() => FinancialStatusBloc(
        repository: getIt(),
      ));
}
