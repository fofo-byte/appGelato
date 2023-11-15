import 'package:flutter/material.dart';

class LoginGlacier extends StatefulWidget {
  const LoginGlacier({super.key});

  @override
  State<LoginGlacier> createState() => _LoginGlacierState();
}

class _LoginGlacierState extends State<LoginGlacier> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Connexion Glacier"),
      ),
      body: Center(
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
                  //login();
                }
              },
              child: const Text('Connexion'),
            ),
          ],
        )),
      ),
    );
  }
}
