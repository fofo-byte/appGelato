import 'package:auth_google_sign/bloc/bloc.dart';
import 'package:flutter/widgets.dart';

class BlocProvider<T extends Bloc> extends StatefulWidget {
  //le bloc qu'on vas utliser
  final T bloc;

  //widget en charge du Bloc
  final Widget child;

  //Constructeur
  const BlocProvider({super.key, required this.bloc, required this.child});

  //Configurer Bloc
  static T? of<T extends Bloc>(BuildContext context) {
    final BlocProvider<T>? provider = context.findAncestorWidgetOfExactType();
    return provider?.bloc;
  }

  @override
  BlocState createState() => BlocState();
}

class BlocState extends State<BlocProvider> {
  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}
