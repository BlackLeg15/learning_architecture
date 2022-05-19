import '../../../../domain/usecases/login_with_username_and_password/entity/entity.dart';
import '../../../../domain/usecases/login_with_username_and_password/params.dart';
import '../../../../infra/usecases/login_with_username_and_password/datasource.dart';
import 'mapper.dart';

class DatasourceMockImpl implements Datasource {
  final MockMapper _mapper;

  DatasourceMockImpl(this._mapper);

  @override
  Future<Entity> call(Params params) async {
    await Future.delayed(const Duration(seconds: 3));
    return _mapper.fromJson({
      'id': '123456abcdef',
      'username': 'Adby Santos',
      'token': '123456abcdef',
    });
  }
}
