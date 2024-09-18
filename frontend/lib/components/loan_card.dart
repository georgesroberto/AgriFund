import 'package:flutter/material.dart';
import 'package:frontend/models/loan.dart';

class LoanCard extends StatelessWidget {
  final Loan loan;
  final VoidCallback onApplyNow;

  const LoanCard({
    super.key,
    required this.loan,
    required this.onApplyNow,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              loan.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8.0),
            Text('Principal: Ksh ${loan.principal.toStringAsFixed(2)}'),
            Text('Rate: ${loan.interestRate.toStringAsFixed(2)}%'),
            Text('Term: ${loan.loanTermDays} days'),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: onApplyNow,
              child: const Text('Apply Now'),
            ),
          ],
        ),
      ),
    );
  }
}
