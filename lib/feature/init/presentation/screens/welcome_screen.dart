import 'package:financial_wellness_app/core/common/resource_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  Future<void> processScreen(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));

    // if (context.mounted) {
    //   context.go('/home');
    // }
  }

  @override
  Widget build(BuildContext context) {
    processScreen(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              logo,
              width: 500,
              height: 500,
            ),
            const SizedBox(height: 16),
            Text(
              'Financial Wellness',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
