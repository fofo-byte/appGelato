import 'package:firebase_auth/firebase_auth.dart';

class Glacier {
  String id;
  String email;
  String name;
  String surname;
  String pseudo;
  String adress;
  int postalCode;
  String region;
  String pays;

  Glacier(
      {this.id = '',
      this.email = '',
      required this.name,
      required this.surname,
      required this.pseudo,
      required this.postalCode,
      required this.adress,
      required this.region,
      required this.pays});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'surname': surname,
      'pseudo': pseudo,
      'postalCode': postalCode,
      'adress': adress,
      'region': region,
      'pays': pays,
    };
  }

  factory Glacier.fromJson(Map<String, dynamic> json) {
    return Glacier(
      id: json['id'],
      name: json['name'],
      surname: json['surname'],
      pseudo: json['pseudo'],
      postalCode: json['postalCode'],
      adress: json['adress'],
      region: json['region'],
      pays: json['pays'],
    );
  }

  String getUser() {
    final currentUser = FirebaseAuth.instance.currentUser!;
    return currentUser.email!;
  }
}
