import 'package:auth_google_sign/components/drawer.dart';
import 'package:auth_google_sign/ui/list.users.dart';
import 'package:auth_google_sign/ui/profile_Sacffold.dart';
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
  int _currentIndex = 0;
  final screens = [
    const ProfileScaffold(),
    const ListUser(),
  ];

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
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Liste'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
