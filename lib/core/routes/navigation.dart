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
    ],
  );
}
