part of 'auth_cubit.dart';

abstract class AuthState {}

class signupInitialdoc extends AuthState {}

class signuploadingdoc extends AuthState {}

class signupSuccessdoc extends AuthState {}

class signupFailuredoc extends AuthState {
  String errorMessage;
  signupFailuredoc({required this.errorMessage});
}
@immutable

class LoginInitialdoc extends AuthState {}

class Loginloadingdoc extends AuthState {}

class LoginSuccessdoc extends AuthState {}

class LoginFailuredoc extends AuthState {
  dynamic errorMessage;
  LoginFailuredoc({required this.errorMessage});
}

class LoginInitialpat extends AuthState {}

class Loginloadingpat extends AuthState {}

class LoginSuccesspat extends AuthState {}

class LoginFailurepat extends AuthState {
  String errorMessage;
  LoginFailurepat({required this.errorMessage});
}

class Forgetpasswordinitial extends AuthState {}

class Forgetpasswordloading extends AuthState {}

class ForgetpasswordSuccess extends AuthState {}

class ForgetpasswordFailure extends AuthState {
  String errorMessage;
  ForgetpasswordFailure({required this.errorMessage});
}
