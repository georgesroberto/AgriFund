import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/loan_application_tile.dart';
import '../views/loan_application_view.dart';

class ApprovedLoans extends StatelessWidget {
  const ApprovedLoans({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoanApplicationView>(
      builder: (context, loanApplicationView, child) {
        final approvedApplications = loanApplicationView.allLoanApplications
            .where((app) => app.status == 'approved')
            .toList();

        return ListView.builder(
          itemCount: approvedApplications.length,
          itemBuilder: (context, index) {
            final loanApplication = approvedApplications[index];
            return LoanApplicationTile(
                loanApplication: loanApplication); // Adjust component
          },
        );
      },
    );
  }
}
