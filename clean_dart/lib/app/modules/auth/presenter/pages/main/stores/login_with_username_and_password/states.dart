import '../../../../../domain/usecases/login_with_username_and_password/entity/entity.dart';

abstract class StoreState {}

class Initial extends StoreState {}
class Loading extends StoreState {}

class Success extends StoreState {
  final Entity entity;

  Success(this.entity);
}

class Error extends StoreState {
  final String message;

  Error(this.message);
}
