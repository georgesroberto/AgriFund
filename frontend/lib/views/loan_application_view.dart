import 'dart:collection';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/models/loan_application.dart'; // Adjust the import based on your project structure

class LoanApplicationView extends ChangeNotifier {
  LoanApplicationView() {
    fetchLoanApplications();
  }

  List<LoanApplication> _loanApplications = [];

  UnmodifiableListView<LoanApplication> get allLoanApplications =>
      UnmodifiableListView(_loanApplications);

  Future<void> fetchLoanApplications() async {
    try {
      final response =
          await http.get(Uri.parse("http://localhost:8000/loan-applications"));
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        _loanApplications = data
            .map<LoanApplication>((json) => LoanApplication.fromJson(json))
            .toList();
        notifyListeners();
      } else {
        if (kDebugMode) {
          print('Server returned status code ${response.statusCode}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching loan applications: $e');
      }
    }
  }

  Future<LoanApplication?> addLoanApplication(
      LoanApplication loanApplication) async {
    final response = await http.post(
      Uri.parse("http://localhost:8000/loan-applications"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(loanApplication.toJson()),
    );
    if (response.statusCode == 201) {
      final newLoanApplication =
          LoanApplication.fromJson(json.decode(response.body));
      _loanApplications.add(newLoanApplication);
      notifyListeners();
      return newLoanApplication;
    }
    return null;
  }

  Future<void> updateLoanApplication(LoanApplication loanApplication) async {
    final response = await http.patch(
      Uri.parse(
          "http://localhost:8000/loan-applications/${loanApplication.id}"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(loanApplication.toJson()),
    );
    if (response.statusCode == 200) {
      final updatedLoanApplication =
          LoanApplication.fromJson(json.decode(response.body));
      final index = _loanApplications
          .indexWhere((la) => la.id == updatedLoanApplication.id);
      if (index != -1) {
        _loanApplications[index] = updatedLoanApplication;
        notifyListeners();
      }
    }
  }

  Future<void> deleteLoanApplication(int id) async {
    final response = await http
        .delete(Uri.parse("http://localhost:8000/loan-applications/$id"));
    if (response.statusCode == 204) {
      _loanApplications.removeWhere((application) => application.id == id);
      notifyListeners();
    }
  }
}
