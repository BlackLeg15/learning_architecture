import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'controller.dart';

class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  final _controller = Modular.get<Controller>();

  void incrementCounter() => setState(_controller.incrementCounter);

  @override
  Widget build(BuildContext context) {
    final counter = _controller.counter;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$counter'),
            ElevatedButton(
              onPressed: incrementCounter,
              child: const Icon(
                Icons.plus_one_outlined,
              ),
            )
          ],
        ),
      ),
    );
  }
}
