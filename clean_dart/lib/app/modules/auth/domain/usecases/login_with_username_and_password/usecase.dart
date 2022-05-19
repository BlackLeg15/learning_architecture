import 'params.dart';
import 'typedefs/result.dart';

abstract class Usecase {
  Result call(Params params);
}