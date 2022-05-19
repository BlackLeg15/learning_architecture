import '../../../../../../core/exceptions/base_exception.dart';
import '../entity/entity.dart';
import 'package:dartz/dartz.dart';

typedef Result = Future<Either<BaseException, Entity>>;