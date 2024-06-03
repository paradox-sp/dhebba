import 'package:nylo_framework/nylo_framework.dart';

class User extends Model {
  final String success;
  final int userId;
  // final String? token; // Ensure this is correctly defined

  User({required this.success, required this.userId});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      success: json['success'],
      userId: json['user_id'],
      // token: json['token'], // Ensure this key matches the JSON response
    );
  }

  @override
  String toString() {
    return 'User{success: $success, userId: $userId}';
  }
}
