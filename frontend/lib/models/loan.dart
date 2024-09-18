// ignore: file_names
class Loan {
  final int id;
  final String name;
  final double principal;
  final double interestRate;
  final int loanTermDays;
  final double processingFee;

  Loan({
    required this.id,
    required this.name,
    required this.principal,
    required this.interestRate,
    required this.loanTermDays,
    required this.processingFee,
  });

  // Convert JSON to Loan object
  factory Loan.fromJson(Map<String, dynamic> json) {
    return Loan(
      id: json['id'],
      name: json['name'],
      principal: double.parse(json['principal'].toString()),
      interestRate: double.parse(json['interest_rate'].toString()),
      loanTermDays: json['loan_term_days'],
      processingFee: double.parse(json['processing_fee'].toString()),
    );
  }

  // Convert Loan object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'principal': principal,
      'interest_rate': interestRate,
      'loan_term_days': loanTermDays,
      'processing_fee': processingFee,
    };
  }

  // Method to calculate the total amount to repay
  double calculateTotalAmount() {
    double interestAmount = (principal * interestRate) / 100;
    return principal + interestAmount + processingFee;
  }
}
