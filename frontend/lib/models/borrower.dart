// ignore: file_names
import 'user.dart'; // Assuming you already have a User model

class Borrower {
  final int id;
  final User user; // User would be another model
  final String phone;
  final String nationalID;

  Borrower({
    required this.id,
    required this.user,
    required this.phone,
    required this.nationalID,
  });

  // Convert JSON to Borrower object
  factory Borrower.fromJson(Map<String, dynamic> json) {
    return Borrower(
      id: json['id'],
      user: User.fromJson(
          json['user']), // Assuming User model has a fromJson method
      phone: json['phone'],
      nationalID: json['nationalID'],
    );
  }

  // Convert Borrower object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user.toJson(),
      'phone': phone,
      'nationalID': nationalID,
    };
  }
}
