import 'package:auth_google_sign/ui/inscription_glacier.dart';
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InscriptionGlacier()));
              },
              child: const Text('Connexion'),
            ),
          ],
        )),
      ),
    );
  }
}
