import 'package:auth_google_sign/controller/no_data.dart';
import 'package:auth_google_sign/services/location_manager.dart';
import 'package:auth_google_sign/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomeController extends StatelessWidget {
  const HomeController({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Position>(
        future: LocationManager().start(),
        builder: ((context, position) => (position.hasData)
            ? Home(
                startPosition: position.data!,
              )
            : NoData()));
  }
}
