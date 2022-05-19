import 'package:dartz/dartz.dart';

import '../../../../../core/exceptions/base_exception.dart';
import '../../../domain/usecases/username_with_email_and_password/exceptions/exceptions.dart';
import '../../../domain/usecases/username_with_email_and_password/params.dart';
import '../../../domain/usecases/username_with_email_and_password/repository.dart';
import '../../../domain/usecases/username_with_email_and_password/typedefs/result.dart';
import 'datasource.dart';

class RepositoryImpl implements Repository {
  final Datasource _datasource;

  RepositoryImpl(this._datasource);

  @override
  Result call(Params params) async {
    try {
      final result = await _datasource(params);
      return Right(result);
    } on BaseException {
      rethrow;
    } catch (exception) {
      return Left(UnknownException(message: exception.toString()));
    }
  }
}
