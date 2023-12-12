import 'package:auth_google_sign/services/google_auth_cubit.dart';
import 'package:auth_google_sign/services/google_auth_state.dart';
import 'package:auth_google_sign/ui/login_glacier.dart';
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
          centerTitle: true,
          backgroundColor: Color.fromARGB(244, 253, 246, 146),
          title: const Text("App Gelato"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  children: [
                    Image.asset("assets/images/logoGelato.jpg"),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.email),
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.lock),
                          hintText: "Password",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (emailController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty) {
                              login();
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      const AlertDialog(
                                        title: Text("Connexion réussie"),
                                        content: Text("Vous êtes connecté"),
                                      ));
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
                      ],
                    ),
                    Divider(),
                    BlocConsumer<GoogleAuthCubit, GoogleAuthState>(
                        builder: (context, state) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 240, 16, 0),
                            ),
                            onPressed: state is GoogleAuthLoadingState
                                ? null
                                : () => context.read<GoogleAuthCubit>().login(),
                            child: state is GoogleAuthLoadingState
                                ? const CircularProgressIndicator()
                                : const Text(
                                    "Connexion avec google",
                                    style: TextStyle(color: Colors.white),
                                  ),
                          );
                        },
                        listener: (context, state) {}),
                    const SizedBox(height: 2),
                    BlocConsumer<GoogleAuthCubit, GoogleAuthState>(
                        builder: (context, state) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 2, 39, 248),
                            ),
                            onPressed: state is GoogleAuthLoadingState
                                ? null
                                : () => context.read<GoogleAuthCubit>().login(),
                            child: state is GoogleAuthLoadingState
                                ? const CircularProgressIndicator()
                                : const Text(
                                    "Connexion avec Facebook",
                                    style: TextStyle(color: Colors.white),
                                  ),
                          );
                        },
                        listener: (context, state) {}),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 238, 168, 88),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginGlacier()));
                      },
                      child: const Text(
                        "Se connecter en tant que glacier",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Future<void> login() async {
    setState(() {
      final auth = FirebaseAuth.instance;

      auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    });
  }
}
