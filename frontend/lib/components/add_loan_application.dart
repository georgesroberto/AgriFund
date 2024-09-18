import 'package:flutter/material.dart';

class AddLoanApplicationScreen extends StatelessWidget {
  const AddLoanApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Loan Application'),
      ),
      body: const Center(
        child: Text('Form to add a new loan application will go here.'),
      ),
    );
  }
}
