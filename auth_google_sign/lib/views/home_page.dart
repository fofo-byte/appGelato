import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Profil'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Favorite'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Message'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ElevatedButton(
                onPressed: () {
                  try {
                    GoogleSignIn().signOut();
                    FirebaseAuth.instance.signOut();
                  } catch (e) {}
                },
                child: const Text("Déconnexion"))
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("App Gelato"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Page d'acceuil"),
            ElevatedButton(
                onPressed: () {
                  try {
                    GoogleSignIn().signOut();
                    FirebaseAuth.instance.signOut();
                  } catch (e) {}
                },
                child: const Text("Déconnexion"))
          ],
        ),
      ),
    );
  }
}
