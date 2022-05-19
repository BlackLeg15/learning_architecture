import '../../../../domain/usecases/login_with_username_and_password/entity/entity.dart';

class MockMapper {
  Entity fromJson(Map json) {
    final id = json['id'];
    final username = json['username'];
    final token = json['token'];
    return Entity(username: username, token: token, id: id);
  }
}
