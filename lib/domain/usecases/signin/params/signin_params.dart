import 'package:equatable/equatable.dart';

class SigninParams extends Equatable {
  final String email;
  final String password;

  const SigninParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}