import 'package:dio/dio.dart';
import 'package:nexo_project/data/common/http_response_validator.dart';
import 'package:nexo_project/data/user.dart';

abstract class IUserDataSource {
  Future<List<UserEntity>> getAll();
}

class UserRemoteDataSource
    with HttpResponseValidator
    implements IUserDataSource {
  final Dio httpClient;

  UserRemoteDataSource(this.httpClient);

  @override
  Future<List<UserEntity>> getAll() async {
    final Response response = await httpClient.get('test');
    validateResponse(response);
    final users = <UserEntity>[];
    (response.data['Users'] as List).forEach((element) {
      users.add(UserEntity.fromJson(element));
    });
    return users;
  }
}
