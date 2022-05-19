import '../../../domain/usecases/username_with_email_and_password/params.dart';
import 'stores/login_with_username_and_password/store.dart';

class Controller {
  final Store store;

  Controller(this.store);

  void loginWithUsernameAndPassword(Params params) {
    store(params);
  }

  void back() {
    store.reset();
  }
}
