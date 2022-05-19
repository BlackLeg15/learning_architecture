import 'params.dart';

import 'typedefs/result.dart';

abstract class Repository {
  Result call(Params params);
}
