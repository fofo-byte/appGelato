import 'package:flutter/material.dart';

class InscriptionGlacier extends StatefulWidget {
  const InscriptionGlacier({super.key});

  @override
  State<InscriptionGlacier> createState() => _InscriptionGlacierState();
}

class _InscriptionGlacierState extends State<InscriptionGlacier> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Inscription Glacier"),
      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(hintText: "Nom d'utilisateur"),
            ),
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
              child: const Text('Inscription'),
            ),
          ],
        ),
      ),
    );
  }
}
