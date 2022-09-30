import 'package:guidealt/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:guidealt/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<Either<Exception, User>> changeProfile(User user) {
    // TODO: implement changeProfile
    throw UnimplementedError();
  }

}