import 'package:equatable/equatable.dart';
import 'package:guidealt/domain/entities/user.dart';

class ChangeProfileParams extends Equatable {
  final User user;

  const ChangeProfileParams({
    required this.user
  });

  @override
  List<Object> get props => [user];
}