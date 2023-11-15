import 'package:auth_google_sign/services/google_auth_cubit.dart';
import 'package:auth_google_sign/services/google_auth_state.dart';
import 'package:auth_google_sign/views/login_glacier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Google Sign"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: "Email"),
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(hintText: "Password"),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      login();
                    }
                  },
                  child: const Text('Connexion'),
                ),
                TextButton(
                  onPressed: () {
                    final auth = FirebaseAuth.instance;
                    auth.createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text);
                  },
                  child: const Text('Inscription'),
                ),
                BlocConsumer<GoogleAuthCubit, GoogleAuthState>(
                    builder: (context, state) {
                      return ElevatedButton(
                          onPressed: state is GoogleAuthLoadingState
                              ? null
                              : () => context.read<GoogleAuthCubit>().login(),
                          child: state is GoogleAuthLoadingState
                              ? const CircularProgressIndicator()
                              : const Text(
                                  "Connexion avec google",
                                ));
                    },
                    listener: (context, state) {}),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginGlacier()));
                  },
                  child: const Text("Se connecter en tant que glacier"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    final auth = FirebaseAuth.instance;
    auth.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
  }
}
