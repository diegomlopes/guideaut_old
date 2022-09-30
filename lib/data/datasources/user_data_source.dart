import 'package:dartz/dartz.dart';
import 'package:guidealt/domain/entities/user.dart';

abstract class UserDataSource {

  Future<Either<Exception, User>> changeProfile(User user);
  
}