import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthEvents extends Equatable {
  const AuthEvents();

  @override
  List<Object> get props => [];
}

class StartEvent extends AuthEvents {}

class AuthCheckEvent extends AuthEvents {}

class LoginButtonPressed extends AuthEvents {
  final String email;
  final String password;
  final String userType;

  LoginButtonPressed(
      {@required this.email, @required this.password, @required this.userType});
}

class SignupButtonPressed extends AuthEvents {
  final String name;
  final String mobileNumber;
  final String email;
  final String password;
  final String userType;

  SignupButtonPressed(
      {@required this.name,
      @required this.mobileNumber,
      @required this.email,
      @required this.password,
      @required this.userType});
}
