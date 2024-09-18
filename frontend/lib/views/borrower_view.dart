import 'dart:collection';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:frontend/models/borrower.dart'; // Adjust the import based on your project structure

class BorrowerView extends ChangeNotifier {
  BorrowerView() {
    fetchBorrowers();
  }

  List<Borrower> _borrowers = [];

  UnmodifiableListView<Borrower> get allBorrowers =>
      UnmodifiableListView(_borrowers);

  Future<void> fetchBorrowers() async {
    try {
      final response =
          await http.get(Uri.parse("http://localhost:8000/borrowers"));
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        _borrowers =
            data.map<Borrower>((json) => Borrower.fromJson(json)).toList();
        notifyListeners();
      } else {
        if (kDebugMode) {
          print('Server returned status code ${response.statusCode}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching borrowers: $e');
      }
    }
  }

  Future<Borrower?> addBorrower(Borrower borrower) async {
    final response = await http.post(
      Uri.parse("http://localhost:8000/borrowers"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(borrower.toJson()),
    );
    if (response.statusCode == 201) {
      final newBorrower = Borrower.fromJson(json.decode(response.body));
      _borrowers.add(newBorrower);
      notifyListeners();
      return newBorrower;
    }
    return null;
  }

  Future<void> updateBorrower(Borrower borrower) async {
    final response = await http.patch(
      Uri.parse("http://localhost:8000/borrowers/${borrower.id}"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(borrower.toJson()),
    );
    if (response.statusCode == 200) {
      final updatedBorrower = Borrower.fromJson(json.decode(response.body));
      final index = _borrowers.indexWhere((b) => b.id == updatedBorrower.id);
      if (index != -1) {
        _borrowers[index] = updatedBorrower;
        notifyListeners();
      }
    }
  }

  Future<void> deleteBorrower(int id) async {
    final response =
        await http.delete(Uri.parse("http://localhost:8000/borrowers/$id"));
    if (response.statusCode == 204) {
      _borrowers.removeWhere((borrower) => borrower.id == id);
      notifyListeners();
    }
  }
}
