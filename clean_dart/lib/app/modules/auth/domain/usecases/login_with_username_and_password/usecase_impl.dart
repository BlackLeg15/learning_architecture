import 'params.dart';
import 'repository.dart';
import 'typedefs/result.dart';
import 'usecase.dart';

class UsecaseImpl implements Usecase {
  final Repository _repository;

  UsecaseImpl(this._repository);

  @override
  Result call(Params params) {
    return _repository(params);
  }
}
