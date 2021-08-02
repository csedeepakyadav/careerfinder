import 'package:careerfinder/src/repositories/auth_repository.dart';
import 'package:flutter/cupertino.dart';

class AuthResponseModel {
  final String status;
  final String message;
  final String name;
  final String email;
  AuthResponseModel(
      {@required this.status, this.message, this.email, this.name});
}
