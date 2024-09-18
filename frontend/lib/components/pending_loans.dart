import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/loan_application_tile.dart';
import '../views/loan_application_view.dart';

class PendingLoans extends StatelessWidget {
  const PendingLoans({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoanApplicationView>(
      builder: (context, loanApplicationView, child) {
        final pendingApplications = loanApplicationView.allLoanApplications
            .where((app) => app.status == 'pending')
            .toList();

        return ListView.builder(
          itemCount: pendingApplications.length,
          itemBuilder: (context, index) {
            final loanApplication = pendingApplications[index];
            return LoanApplicationTile(
                loanApplication: loanApplication); // Adjust component
          },
        );
      },
    );
  }
}
