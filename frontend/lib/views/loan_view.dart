import 'dart:collection';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/models/loan.dart';

class LoanView extends ChangeNotifier {
  LoanView() {
    fetchLoans();
  }

  List<Loan> _loans = [];

  UnmodifiableListView<Loan> get allLoans => UnmodifiableListView(_loans);

  Future<void> fetchLoans() async {
    try {
      final response =
          await http.get(Uri.parse("http://localhost:8000/api/loans"));
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        _loans = data.map<Loan>((json) => Loan.fromJson(json)).toList();
        notifyListeners();
      } else {
        if (kDebugMode) {
          print('Server returned status code ${response.statusCode}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching loans: $e');
      }
    }
  }

  Future<Loan?> addLoan(Loan loan) async {
    final response = await http.post(
      Uri.parse("http://127.0.0.1:8000/loans?format=json"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(loan.toJson()),
    );
    if (response.statusCode == 201) {
      final newLoan = Loan.fromJson(json.decode(response.body));
      _loans.add(newLoan);
      notifyListeners();
      return newLoan;
    }
    return null;
  }

  Future<void> updateLoan(Loan loan) async {
    final response = await http.patch(
      Uri.parse("http://localhost:8000/loans/${loan.id}"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(loan.toJson()),
    );
    if (response.statusCode == 200) {
      final updatedLoan = Loan.fromJson(json.decode(response.body));
      final index = _loans.indexWhere((l) => l.id == updatedLoan.id);
      if (index != -1) {
        _loans[index] = updatedLoan;
        notifyListeners();
      }
    }
  }

  Future<void> deleteLoan(int id) async {
    final response =
        await http.delete(Uri.parse("http://localhost:8000/loans/$id"));
    if (response.statusCode == 204) {
      _loans.removeWhere((loan) => loan.id == id);
      notifyListeners();
    }
  }

  applyForLoan(double amount, String token) {}
}
