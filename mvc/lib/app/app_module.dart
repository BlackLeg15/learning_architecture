import 'package:flutter_modular/flutter_modular.dart';
import 'package:mvc/app/modules/counter/module.dart' as counter;

class AppModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: counter.Module()),
  ];
}
