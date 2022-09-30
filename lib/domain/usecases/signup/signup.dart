import 'package:dartz/dartz.dart';
import 'package:guidealt/domain/entities/user.dart';
import 'package:guidealt/domain/errors/error.dart';
import 'package:guidealt/domain/repositories/authentication_repository.dart';
import 'package:guidealt/domain/usecases/signup/params/signup_params.dart';
import 'package:guidealt/domain/usecases/usecase.dart';

class Signup extends UseCase<User, SignupParams> {

  final AuthenticationRepository repository;

  Signup({
    required this.repository
  });

  @override
  Future<Either<ErrorHandler, User>> call(SignupParams params) async {
    final result = await repository.signup(params.email, params.password);
    return result;
  }

}