import 'package:auth_google_sign/modele/users.dart';
import 'package:auth_google_sign/ui/register_profile_scaffold.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  List<Users> user = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {
              if (user.isEmpty) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Registerprofile()));
              }
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .where('email', isEqualTo: currentUser.email)
            .snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text(
                  "Pas de profil creer , veuillez en creer un en appuyant sur l'icone en haut a droite"),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png"),
                    ),
                    title: Text("Nom : ${snapshot.data.docs[index]['name']}"),
                    subtitle: Text(
                        "Prenom : ${snapshot.data.docs[index]['surname']}"),
                    trailing: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Registerprofile()));
                        },
                        icon: const Icon(Icons.settings))),
              );
            },
          );
        },
      ),
    );
  }
}
