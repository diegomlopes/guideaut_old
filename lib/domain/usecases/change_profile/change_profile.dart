import 'package:dartz/dartz.dart';
import 'package:guidealt/domain/entities/user.dart';
import 'package:guidealt/domain/repositories/user_repository.dart';
import 'package:guidealt/domain/usecases/change_profile/params/change_profile_params.dart';
import 'package:guidealt/domain/usecases/usecase.dart';

class ChangeProfile extends UseCase<User, ChangeProfileParams> {

  final UserRepository repository;

  ChangeProfile({
    required this.repository
  });

  @override
  Future<Either<Exception, User>> call(ChangeProfileParams params) async {
    final result = await repository.changeProfile(params.user);
    return result;
  }

}