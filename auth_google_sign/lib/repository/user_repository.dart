import 'package:auth_google_sign/modele/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future addUser(Users user) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc();
  user.id = docUser.id;
  await docUser.set(user.toJson());
}
