import 'package:offline_first/domain/entities/user.dart';

abstract class UserRepository {
  Future<User> getUser();
}
