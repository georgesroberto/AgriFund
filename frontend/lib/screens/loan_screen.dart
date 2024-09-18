import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:frontend/views/loan_view.dart';
import 'package:frontend/components/loan_card.dart';

class LoanScreen extends StatelessWidget {
  const LoanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loans'),
      ),
      body: Consumer<LoanView>(
        builder: (context, loanView, child) {
          if (loanView.allLoans.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: loanView.allLoans.length,
            itemBuilder: (context, index) {
              final loan = loanView.allLoans[index];

              return LoanCard(
                loan: loan,
                onApplyNow: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Confirm Loan Application'),
                        content: Text(
                          'Are you sure you want to apply for the loan:\n\n'
                          'Name: ${loan.name}\n'
                          'Principal: Ksh ${loan.principal.toStringAsFixed(2)}\n'
                          'Rate: ${loan.interestRate.toStringAsFixed(2)}%\n'
                          'Term: ${loan.loanTermDays} days\n'
                          'Total Repayment: Ksh ${loan.calculateTotalAmount().toStringAsFixed(2)}',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Add your apply loan logic here
                              Navigator.of(context).pop();
                            },
                            child: const Text('Apply'),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
