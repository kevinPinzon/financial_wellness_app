import 'package:financial_wellness_app/core/services/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:financial_wellness_app/feature/financial_calculator/presentation/bloc/financial_status_bloc.dart'; // Import FinancialStatusBloc
import 'package:financial_wellness_app/core/routes/navigation.dart';
import 'package:financial_wellness_app/l10n/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup(); // Initialize GetIt
  runApp(App());
}

class App extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FinancialStatusBloc>(
      create: (context) => getIt<
          FinancialStatusBloc>(), // Get the FinancialStatusBloc from GetIt
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.router, // Setting up the router
        supportedLocales: const [
          Locale('en', ''),
          Locale('es', ''),
        ],
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
      ),
    );
  }
}
