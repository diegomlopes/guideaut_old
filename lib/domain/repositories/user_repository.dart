import 'package:dartz/dartz.dart';
import 'package:guidealt/domain/entities/user.dart';

abstract class UserRepository {

  Future<Either<Exception, User>> changeProfile(User user);

}