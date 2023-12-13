import 'package:auth_google_sign/components/list_title_drawer.dart';
import 'package:auth_google_sign/ui/list.users.dart';
import 'package:auth_google_sign/ui/message_scaffold.dart';
import 'package:auth_google_sign/ui/profile_Sacffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  //final void Function()? onProfileTap;
  //final void Function()? onSignOut;
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    //data current user
    final currentUser = FirebaseAuth.instance.currentUser!;
    //navigate to profile page
    void onProfileTap() {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ProfileScaffold()));
    }

    //navigate to favorite page
    void onFavoriteTap() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ListUser()));
    }

    //navigate to message page
    void onMessageTap() {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const MessageScaffold()));
    }

    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //header
              const DrawerHeader(
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 64,
                ),
              ),
              MyListTitle(
                icon: Icons.email,
                text: currentUser.email!,
                onTap: () => Navigator.pop(context),
              ),
              MyListTitle(
                icon: Icons.home,
                text: 'H O M  E',
                onTap: () => Navigator.pop(context),
              ),
              MyListTitle(
                icon: Icons.person_2,
                text: 'P R O F I L E',
                onTap: onProfileTap,
              ),
              MyListTitle(
                icon: Icons.favorite,
                text: 'F A V O R  I  T E',
                onTap: onFavoriteTap,
              ),
              MyListTitle(
                icon: Icons.message,
                text: 'M E S S A G E',
                onTap: onMessageTap,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: MyListTitle(
              icon: Icons.logout,
              text: 'D E C O N N E X I O N',
              onTap: () => FirebaseAuth.instance.signOut(),
            ),
          ),
        ],
      ),
    );
  }
}
