// ignore: file_names
class Loan {
  final int id;
  final double amount;
  final String status;

  Loan({required this.id, required this.amount, required this.status});

  // Factory constructor to create a Loan object from a JSON map
  factory Loan.fromJson(Map<String, dynamic> json) {
    return Loan(
      id: json['id'],
      amount: json['amount'].toDouble(),
      status: json['status'],
    );
  }
}
