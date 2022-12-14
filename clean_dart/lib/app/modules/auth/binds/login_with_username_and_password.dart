import 'package:flutter_modular/flutter_modular.dart';

import '../domain/usecases/login_with_username_and_password/usecase_impl.dart';
import '../external/datasources/login_with_username_and_password/mock/datasource_impl.dart';
import '../external/datasources/login_with_username_and_password/mock/mapper.dart';
import '../infra/usecases/login_with_username_and_password/repository_impl.dart';
import '../presenter/pages/main/stores/login_with_username_and_password/store.dart';

final List<Bind> binds = [
  Bind((i) => Store(i())),
  Bind((i) => UsecaseImpl(i())),
  Bind((i) => RepositoryImpl(i())),
  Bind((i) => DatasourceMockImpl(i())),
  Bind((i) => MockMapper()),
];
