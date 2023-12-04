import 'package:auth_google_sign/components/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

//navigate to profile page

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "App Gelato",
        ),
        actions: [
          //deconnect
          IconButton(
              onPressed: () {
                try {
                  GoogleSignIn().signOut();
                  FirebaseAuth.instance.signOut();
                } catch (e) {}
              },
              icon: const Icon(Icons.logout))
        ],
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
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Liste'),
        ],
      ),
    );
  }
}
