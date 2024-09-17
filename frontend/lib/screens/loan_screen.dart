import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../views/loan_view.dart';

class LoanScreen extends StatefulWidget {
  // Add the key parameter to the constructor
  const LoanScreen({super.key});

  @override
  _LoanScreenState createState() => _LoanScreenState();
}

class _LoanScreenState extends State<LoanScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final LoanView _loanView = LoanView(); // Instance of LoanView

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _submitLoanApplication() async {
    if (_formKey.currentState!.validate()) {
      final amount = double.parse(_amountController.text);
      const token = 'your_jwt_token_here'; // Replace with stored JWT token

      try {
        await _loanView.applyForLoan(amount, token);
        if (kDebugMode) {
          print('Loan submitted successfully');
        }
      } catch (e) {
        if (kDebugMode) {
          print('Error applying for loan: $e');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apply for a Loan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _amountController,
                decoration: const InputDecoration(labelText: 'Loan Amount'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a loan amount';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitLoanApplication,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
