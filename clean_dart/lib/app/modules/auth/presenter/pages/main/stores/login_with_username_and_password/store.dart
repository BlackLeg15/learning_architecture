import 'package:clean_dart/app/modules/auth/domain/usecases/username_with_email_and_password/params.dart';
import 'package:clean_dart/app/modules/auth/domain/usecases/username_with_email_and_password/usecase.dart';
import 'package:clean_dart/app/modules/auth/presenter/pages/main/stores/login_with_username_and_password/states.dart';
import 'package:flutter/cupertino.dart';

class Store extends ChangeNotifier {
  StoreState _state = Initial();
  StoreState get state => _state;

  final Usecase _usecase;

  Store(this._usecase);

  void reset() {
    _state = Initial();
    notifyListeners();
  }

  Future<void> call(Params params) async {
    _state = Loading();
    notifyListeners();
    final result = await _usecase(params);
    result.fold(
      (exception) {
        _state = Error(exception.message);
        notifyListeners();
      },
      (entity) {
        _state = Success(entity);
        notifyListeners();
      },
    );
  }
}
