import 'package:clean_dart/app/modules/auth/auth_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: AuthModule())
  ];
}