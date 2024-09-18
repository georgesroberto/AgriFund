import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/loan_application_tile.dart';
import '../views/loan_application_view.dart';

class LoanList extends StatelessWidget {
  const LoanList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoanApplicationView>(
      builder: (context, loanApplicationView, child) {
        final loanApplications = loanApplicationView.allLoanApplications;

        return ListView.builder(
          itemCount: loanApplications.length,
          itemBuilder: (context, index) {
            final loanApplication = loanApplications[index];
            return LoanApplicationTile(
                loanApplication: loanApplication); // Adjust component
          },
        );
      },
    );
  }
}
