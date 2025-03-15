import 'package:financial_wellness_app/feature/financial_calculator/presentation/screens/financial_status_form.dart';
import 'package:financial_wellness_app/feature/financial_calculator/presentation/screens/financial_status_result.dart';
import 'package:financial_wellness_app/feature/init/presentation/screens/welcome_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter();

  late final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
          path: '/home',
          builder: (context, state) => FinancialStatusFormPage(),
          routes: [
            GoRoute(
              path: '/result/:score',
              builder: (context, state) {
                final score = state.pathParameters['score']!;
                return FinancialStatusResultPage(score: score);
              },
            ),
          ]),
    ],
  );
}
