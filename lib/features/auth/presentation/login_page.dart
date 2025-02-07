import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_patrol_testing_framework/features/auth/presentation/bloc/login_bloc.dart';
import 'package:flutter_patrol_testing_framework/features/home/presentation/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final _userNameController = TextEditingController(text: 'emilys');
  // final _passwordController = TextEditingController(text: 'emilyspass');

  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            setState(() {
              isLoading = true;
            });
          }
          if (state is LoginSuccess) {
            setState(() {
              isLoading = false;
            });
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const HomePage();
                },
              ),
              (route) => false,
            );
          }
          if (state is LoginFailed) {
            setState(() {
              isLoading = false;
            });
            var snackBar = SnackBar(content: Text(state.errorMessage));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: SafeArea(
          minimum: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login Page',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                key: const Key('UserForm'),
                controller: _userNameController,
                decoration: const InputDecoration(hintText: 'Username'),
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                key: const Key('PasswordForm'),
                controller: _passwordController,
                decoration: const InputDecoration(hintText: 'Password...'),
              ),
              const SizedBox(
                height: 24,
              ),
              Visibility(
                replacement: const CupertinoActivityIndicator(),
                visible: !isLoading,
                child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () {
                      context.read<LoginBloc>().add(LoginActionEvent(
                          username: _userNameController.text,
                          password: _passwordController.text));
                    },
                    child: const Text('Login')),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
