import 'package:nylo_framework/nylo_framework.dart';

class User extends Model {
  String success;
  int userId;

  User(this.success, this.userId);

  User.fromJson(Map<String, dynamic> data)
      : success = data['success'],
        userId = data['user_id'];

  Map<String, dynamic> toJson() => {"success": success, "userId": userId};

  @override
  String toString() {
    return 'User{success: $success, userId: $userId}';
  }
}
