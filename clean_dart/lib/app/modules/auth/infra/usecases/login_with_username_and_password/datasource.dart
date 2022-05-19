import '../../../domain/usecases/username_with_email_and_password/entity/entity.dart';
import '../../../domain/usecases/username_with_email_and_password/params.dart';

abstract class Datasource {
  Future<Entity> call(Params params);
}
