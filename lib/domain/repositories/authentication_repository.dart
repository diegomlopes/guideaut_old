import 'package:dartz/dartz.dart';
import 'package:guidealt/domain/entities/user.dart';
import 'package:guidealt/domain/errors/error.dart';

abstract class AuthenticationRepository {

  Future<Either<ErrorHandler, User>> signup(String email, String password);
  Future<Either<ErrorHandler, User>> signin(String email, String password);

}