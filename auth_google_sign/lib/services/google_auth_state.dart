import 'package:firebase_auth/firebase_auth.dart';

abstract class GoogleAuthState {}

class GoogleAuthInitialState extends GoogleAuthState {}

class GoogleAuthLoadingState extends GoogleAuthState {}

class GoogleAuthSuccesState extends GoogleAuthState {
  final User user;

  GoogleAuthSuccesState(this.user);
}

class GoogleAuthFailedState extends GoogleAuthState {
  final String error;

  GoogleAuthFailedState(this.error);
}
