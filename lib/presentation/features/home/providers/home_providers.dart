import 'package:guidealt/domain/entities/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeProviders {

  static final StateProvider<User?> userLoggedProvider =
      StateProvider<User?>((StateProviderRef<User?> ref) => null);
      
}