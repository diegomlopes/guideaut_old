import 'package:guidealt/data/datasources/remote/authentication_data_source_sql.dart';
import 'package:guidealt/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:guidealt/domain/errors/error.dart';
import 'package:guidealt/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {

  AuthenticationDataSourceSql dataSourceSql;

  AuthenticationRepositoryImpl({
    required this.dataSourceSql
  });

  @override
  Future<Either<ErrorHandler, User>> signin(String email, String password) {
    return dataSourceSql.signin(email, password);
  }

  @override
  Future<Either<ErrorHandler, User>> signup(String email, String password) {
    return dataSourceSql.signup(email, password);
  }

}