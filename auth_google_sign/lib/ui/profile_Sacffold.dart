import 'package:auth_google_sign/components/text_box.dart';
import 'package:auth_google_sign/ui/register_profile_scaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScaffold extends StatefulWidget {
  const ProfileScaffold({super.key});
  //final GoogleSignInAccount id;

  @override
  State<ProfileScaffold> createState() => _ProfileScaffoldState();
}

class _ProfileScaffoldState extends State<ProfileScaffold> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: const Text('Mon profil'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Registerprofile(),
                    ),
                  );
                },
                icon: const Icon(Icons.settings))
          ],
        ),
        body: ListView(
          children: [
            const SizedBox(height: 50.0),
            //icon profil
            const Icon(
              Icons.person_2,
              size: 85,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              currentUser.email!,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                'Mes Informations',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const MyTextBox(sectionName: 'Prénom :', text: 'Alfonso'),
            const MyTextBox(sectionName: 'Nom : ', text: 'Casucci'),
            const MyTextBox(
                sectionName: 'Adresse : ', text: "Rue de l' avenir , 65"),
            const MyTextBox(sectionName: 'Code postale : ', text: '7100'),
            const MyTextBox(sectionName: 'Commune : ', text: 'La Louvière'),
            const MyTextBox(sectionName: "Pays : ", text: 'Belgique'),
          ],
        ));
  }
}
