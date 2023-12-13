import 'package:auth_google_sign/components/drawer.dart';
import 'package:auth_google_sign/ui/list.users.dart';
import 'package:auth_google_sign/ui/map_view.dart';
import 'package:auth_google_sign/ui/profile_Sacffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Home extends StatefulWidget {
  final Position startPosition;

  const Home({Key? key, required this.startPosition}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: const Center(
                child: MapView(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "List of Gelato",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            Divider(
              color: Theme.of(context).colorScheme.secondary,
              thickness: 1,
            ),
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
