import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitState extends AuthState {}

class AuthLoadingState extends AuthState {}

class UserLoginSuccessState extends AuthState {}
class UserLoggedInState extends AuthState {}

class UserNotLoggedInState extends AuthState {}

class UserSignedup extends AuthState{}

class AuthErrorState extends AuthState {
  final String message;
  AuthErrorState({@required this.message});
}
