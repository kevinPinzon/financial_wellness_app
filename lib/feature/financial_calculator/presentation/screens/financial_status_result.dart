import 'package:financial_wellness_app/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';

class FinancialStatusResultPage extends StatelessWidget {
  final String score;

  const FinancialStatusResultPage({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).resultPageTitle)),
      body: Center(
        child: Text(
          '${S.of(context).scoreMessage} $score',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
