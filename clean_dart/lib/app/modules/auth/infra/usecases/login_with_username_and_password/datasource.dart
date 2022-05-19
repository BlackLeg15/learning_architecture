import '../../../domain/usecases/login_with_username_and_password/entity/entity.dart';
import '../../../domain/usecases/login_with_username_and_password/params.dart';

abstract class Datasource {
  Future<Entity> call(Params params);
}
