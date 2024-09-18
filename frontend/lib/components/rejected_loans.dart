import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/loan_application_tile.dart';
import '../views/loan_application_view.dart';

class RejectedLoans extends StatelessWidget {
  const RejectedLoans({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoanApplicationView>(
      builder: (context, loanApplicationView, child) {
        final rejectedApplications = loanApplicationView.allLoanApplications
            .where((app) => app.status == 'rejected')
            .toList();

        return ListView.builder(
          itemCount: rejectedApplications.length,
          itemBuilder: (context, index) {
            final loanApplication = rejectedApplications[index];
            return LoanApplicationTile(
                loanApplication: loanApplication); // Adjust component
          },
        );
      },
    );
  }
}
