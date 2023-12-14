import 'package:flutter/material.dart';

class HomePageGlacier extends StatefulWidget {
  const HomePageGlacier({super.key});

  @override
  State<HomePageGlacier> createState() => _HomePageGlacierState();
}

class _HomePageGlacierState extends State<HomePageGlacier> {
  List<String> listeNavigation = [
    "Mon Profil",
    "Mes Commandes",
    "Mes Produits",
    "Mes Statistiques",
    "Mes Paramètres",
    "Déconnexion"
  ];

  List<Widget> itemNavigation() {
    List<Widget> items = [];
    listeNavigation.forEach((element) {
      final widget = elementToShow(element);
      items.add(widget);
    });
    return items;
  }

  Widget elementToShow(String element) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(element),
        ],
      ),
    );
  }

  Widget buildGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: listeNavigation.length,
      itemBuilder: (BuildContext context, int index) {
        return elementToShow(listeNavigation[index]);
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 190, 192, 194),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text("AppGelato",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(77, 1, 218, 1))),
                const SizedBox(
                  height: 20,
                ),
                buildGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
