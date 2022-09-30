import 'package:dartz/dartz.dart';
import 'package:guidealt/data/datasources/remote/authentication_data_source_sql.dart';
import 'package:guidealt/data/repositories/authentication_repository_impl.dart';
import 'package:guidealt/domain/entities/user.dart';
import 'package:guidealt/domain/errors/error.dart';
import 'package:guidealt/domain/usecases/signup/params/signup_params.dart';
import 'package:guidealt/domain/usecases/signup/signup.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignupPageProviders {
  
  static final StateProvider<bool> isLogingProvider =
      StateProvider<bool>((StateProviderRef<bool> ref) => false);

  static final Provider<AuthenticationDataSourceSql> authenticationDataSourceProvider =
      Provider<AuthenticationDataSourceSql>(
          (ProviderRef<AuthenticationDataSourceSql> ref) => AuthenticationDataSourceSql());

  static final Provider<AuthenticationRepositoryImpl> authenticationRepositoryProvider =
      Provider<AuthenticationRepositoryImpl>(
          (ProviderRef<AuthenticationRepositoryImpl> ref) => 
            AuthenticationRepositoryImpl(dataSourceSql: ref.watch(authenticationDataSourceProvider))
          );
          
  static Future<Either<ErrorHandler, User>> register(WidgetRef ref, String email, String password) {
    final Signup signup = Signup(repository: ref.watch(authenticationRepositoryProvider));

    ref.read(isLogingProvider.notifier).state = true;

    return signup(SignupParams(email: email, password: password));
  }

}