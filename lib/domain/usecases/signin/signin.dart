import 'package:dartz/dartz.dart';
import 'package:guidealt/domain/entities/user.dart';
import 'package:guidealt/domain/errors/error.dart';
import 'package:guidealt/domain/repositories/authentication_repository.dart';
import 'package:guidealt/domain/usecases/signin/params/signin_params.dart';
import 'package:guidealt/domain/usecases/usecase.dart';

class Signin extends UseCase<User, SigninParams> {

  final AuthenticationRepository repository;

  Signin({
    required this.repository
  });

  @override
  Future<Either<ErrorHandler, User>> call(SigninParams params) async {
    final result = await repository.signin(params.email, params.password);
    return result;
  }

}