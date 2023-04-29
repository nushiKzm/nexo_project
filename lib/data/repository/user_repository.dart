import 'package:nexo_project/common/http.dart';
import 'package:nexo_project/data/source/user_data_source.dart';
import 'package:nexo_project/data/user.dart';

final userRepository = UserRepository(UserRemoteDataSource(httpClientDio));

abstract class IUserRepository {
  Future<List<UserEntity>> getAll();
}

class UserRepository implements IUserRepository {
  final IUserDataSource dataSource;

  UserRepository(this.dataSource);

  @override
  Future<List<UserEntity>> getAll() => dataSource.getAll();
}
