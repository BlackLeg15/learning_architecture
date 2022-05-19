import 'package:flutter/cupertino.dart';

import '../../../../../domain/usecases/username_with_email_and_password/params.dart';
import '../../../../../domain/usecases/username_with_email_and_password/usecase.dart';
import 'states.dart';

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
