part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class LogincubitInitial extends AuthState {}
class Logincubitloading extends AuthState {}
class Logincubitsuccess extends AuthState {}
class Logincubitfailure extends AuthState {
  
}
class RegistercubitInitial extends AuthState {}
class Registercubitloading extends AuthState {}
class Registercubitsuccess extends AuthState {}
class Registercubitfailure extends AuthState {}    

class Forgetpasswordinitial extends AuthState {}

class Forgetpasswordloading extends AuthState {}

class ForgetpasswordSuccess extends AuthState {}

class ForgetpasswordFailure extends AuthState {
  String errorMessage;
  ForgetpasswordFailure({required this.errorMessage});
}