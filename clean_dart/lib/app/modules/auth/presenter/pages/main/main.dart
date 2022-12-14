import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../domain/usecases/login_with_username_and_password/params.dart';
import 'controller.dart';
import 'stores/login_with_username_and_password/states.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  final _controller = Modular.get<Controller>();

  var username = '';
  var password = '';
  var isPasswordObscure = true;

  String? usernameError;
  String? passwordError;

  void onChangeUsername(String value) {
    username = value;
    validateNewUsername();
  }

  void validateNewUsername() {
    if (username.isEmpty) {
      setState(() => usernameError = 'Digite um nome de usuário');
    } else if (usernameError?.isNotEmpty == true) {
      setState(() {
        usernameError = null;
      });
    }
  }

  void onChangePassword(String value) {
    password = value;
    validateNewPassword();
  }

  void validateNewPassword() {
    if (password.isEmpty) {
      setState(() => passwordError = 'Digite uma senha');
    } else if (passwordError?.isNotEmpty == true) {
      setState(() {
        passwordError = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
          animation: _controller.store,
          builder: (context, child) {
            final backWidget = IconButton(
                onPressed: () {
                  _controller.back();
                },
                icon: const Icon(Icons.arrow_back));
            final state = _controller.store.state;
            if (state is Initial) {
              return Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 300,
                    maxHeight: 600,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Nome de usuário',
                          errorText: usernameError,
                        ),
                        onChanged: onChangeUsername,
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          errorText: passwordError,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isPasswordObscure = !isPasswordObscure;
                              });
                            },
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: isPasswordObscure ? Colors.grey : Colors.red,
                            ),
                          ),
                        ),
                        onChanged: onChangePassword,
                        obscureText: isPasswordObscure,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (password.isEmpty || username.isEmpty || usernameError != null || passwordError != null) return;
                          _controller.loginWithUsernameAndPassword(
                            Params(username: username, password: password),
                          );
                        },
                        child: const Text('Entrar'),
                      )
                    ],
                  ),
                ),
              );
            }
            if (state is Success) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    backWidget,
                    Text(state.entity.username),
                  ],
                ),
              );
            }
            if (state is Error) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    backWidget,
                    Text(state.message),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator.adaptive());
          }),
    );
  }
}
