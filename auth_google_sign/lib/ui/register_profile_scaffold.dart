import 'package:auth_google_sign/modele/users.dart';
import 'package:auth_google_sign/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Registerprofile extends StatelessWidget {
  const Registerprofile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentEmail = FirebaseAuth.instance.currentUser!;
    final _controllerName = TextEditingController();
    final _controllerSurname = TextEditingController();
    final _controllerPseudo = TextEditingController();
    final _controllerAdress = TextEditingController();
    final _controllerPostalcode = TextEditingController();
    final _controllerRegion = TextEditingController();
    final _controllerPays = TextEditingController();

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
                  controller: _controllerName,
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
                  controller: _controllerSurname,
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
                  controller: _controllerPseudo,
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
                  controller: _controllerAdress,
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
                  controller: _controllerPostalcode,
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
                  controller: _controllerRegion,
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
                  controller: _controllerPays,
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
                      name: _controllerName.text,
                      surname: _controllerSurname.text,
                      pseudo: _controllerPseudo.text,
                      adress: _controllerAdress.text,
                      postalCode: int.parse(_controllerPostalcode.text),
                      region: _controllerRegion.text,
                      pays: _controllerPays.text,
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
