import 'package:auth_google_sign/modele/users.dart';
import 'package:auth_google_sign/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Registerprofile extends StatelessWidget {
  const Registerprofile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentEmail = FirebaseAuth.instance.currentUser!;
    final controllerName = TextEditingController();
    final controllerSurname = TextEditingController();
    final controllerPseudo = TextEditingController();
    final controllerAdress = TextEditingController();
    final controllerPostalcode = TextEditingController();
    final controllerRegion = TextEditingController();
    final controllerPays = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Registerprofile'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: controllerName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    labelText: 'Nom',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: controllerSurname,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    labelText: 'Prenom',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: controllerPseudo,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    labelText: 'Speudo',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: controllerAdress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    labelText: 'Adresse',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: controllerPostalcode,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    labelText: 'Code Postal',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: controllerRegion,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    labelText: 'Commune',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: controllerPays,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    labelText: 'Pays',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    final user = Users(
                      email: currentEmail.email!,
                      name: controllerName.text,
                      surname: controllerSurname.text,
                      pseudo: controllerPseudo.text,
                      adress: controllerAdress.text,
                      postalCode: int.parse(controllerPostalcode.text),
                      region: controllerRegion.text,
                      pays: controllerPays.text,
                    );

                    addUser(user);
                  },
                  child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      child: const Text(
                        'Valider',
                        textAlign: TextAlign.center,
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
