import 'package:nylo_framework/nylo_framework.dart';

class User extends Model {
  String? success;
  int? userId;

  User();

  User.fromJson(Map<String, dynamic> data) {
    success = data['success'];
    userId = data['user_id'];
  }

  Object? get token => null;

  @override
  toJson() => {
        'success': success,
        'user_id': userId,
      };
}
