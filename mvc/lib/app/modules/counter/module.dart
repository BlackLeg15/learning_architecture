import 'package:flutter_modular/flutter_modular.dart' as modular;
import 'package:mvc/app/modules/counter/controller.dart';

import 'model.dart';
import 'view.dart';

class Module extends modular.Module {
  @override
  final List<modular.Bind> binds = [
    modular.Bind((i) => Controller(i())),
    modular.Bind((i) => Model()),
  ];

  @override
  final List<modular.ModularRoute> routes = [
    modular.ChildRoute('/', child: (context, args) => const View())
  ];
}
