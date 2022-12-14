import 'package:flutter_modular/flutter_modular.dart';

import 'binds/login_with_username_and_password.dart' as login_with_username_and_password;
import 'presenter/pages/main/controller.dart';
import 'presenter/pages/main/main.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    ...login_with_username_and_password.binds,
    Bind((i) => Controller(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const Main())
  ];
}