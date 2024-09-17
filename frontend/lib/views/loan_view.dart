import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoanView {
  final String baseUrl =
      'http://127.0.0.1:8000/api/'; // Update with your Django backend URL

  Future<void> applyForLoan(double amount, String token) async {
    final url = Uri.parse('${baseUrl}loans/');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'amount': amount}),
    );

    if (response.statusCode == 201) {
      if (kDebugMode) {
        print('Loan application successful');
      }
    } else {
      if (kDebugMode) {
        print('Failed to apply for loan: ${response.body}');
      }
    }
  }
}
