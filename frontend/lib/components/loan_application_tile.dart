import 'package:flutter/material.dart';
import 'package:frontend/models/loan_application.dart'; // Adjust import paths

class LoanApplicationTile extends StatelessWidget {
  final LoanApplication loanApplication;

  const LoanApplicationTile({super.key, required this.loanApplication});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${loanApplication.loan.name} - ${loanApplication.status}'),
      subtitle: Text('Principal: \$${loanApplication.loan.principal}'),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        // Navigate to detailed view or handle tap
      },
    );
  }
}
