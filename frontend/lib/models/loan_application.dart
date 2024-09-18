// ignore: file_names
import 'borrower.dart';
import 'loan.dart';

class LoanApplication {
  final int id;
  final Borrower borrower;
  final Loan loan;
  final String status;
  final DateTime appliedAt;
  double repaidAmount;
  bool isFullyRepaid;

  LoanApplication({
    required this.id,
    required this.borrower,
    required this.loan,
    required this.status,
    required this.appliedAt,
    this.repaidAmount = 0.00,
    this.isFullyRepaid = false,
  });

  // Convert JSON to LoanApplication object
  factory LoanApplication.fromJson(Map<String, dynamic> json) {
    return LoanApplication(
      id: json['id'],
      borrower: Borrower.fromJson(json['borrower']),
      loan: Loan.fromJson(json['loan']),
      status: json['status'],
      appliedAt: DateTime.parse(json['applied_at']),
      repaidAmount: double.parse(json['repaid_amount'].toString()),
      isFullyRepaid: json['is_fully_repaid'],
    );
  }

  // Convert LoanApplication object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'borrower': borrower.toJson(),
      'loan': loan.toJson(),
      'status': status,
      'applied_at': appliedAt.toIso8601String(),
      'repaid_amount': repaidAmount,
      'is_fully_repaid': isFullyRepaid,
    };
  }

  // Method to calculate the total amount to repay for this specific application
  double calculateTotalAmount() {
    return loan.calculateTotalAmount();
  }

  // Method to update repayment status
  void updateRepaymentStatus() {
    double totalAmount = calculateTotalAmount();
    if (repaidAmount >= totalAmount) {
      isFullyRepaid = true;
    }
  }
}
