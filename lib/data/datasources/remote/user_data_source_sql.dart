import 'package:dartz/dartz.dart';
import 'package:guidealt/data/datasources/user_data_source.dart';
import 'package:guidealt/domain/entities/user.dart';

class UserDataSourceSql implements UserDataSource {
  @override
  Future<Either<Exception, User>> changeProfile(User user) {
    // TODO: implement changeProfile
    throw UnimplementedError();
  }

}