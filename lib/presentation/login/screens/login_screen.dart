import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    passwordController.text = "emilyspass";
    usernameController.text = "emilys";

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Token: ${state.token}')));
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(labelText: 'Username'),
                ),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
                const SizedBox(height: 20),
                if (state is LoginLoading)
                  const CircularProgressIndicator()
                else
                  ElevatedButton(
                    onPressed: () {
                      context.read<LoginBloc>().add(
                        LoginSubmitted(
                          usernameController.text,
                          passwordController.text,
                        ),
                      );
                    },
                    child: const Text('Login'),
                  ),

                if (state is LoginSuccess)
                  Text(
                    "Login success",
                    style: const TextStyle(color: Colors.green),
                  ),

                if (state is LoginFailure)
                  Text(
                    state.message,
                    style: const TextStyle(color: Colors.red),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
