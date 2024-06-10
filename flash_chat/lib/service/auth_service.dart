import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future deleteUser(String password) async {
    try {
      final user = _auth.currentUser;
      AuthCredential credentials = EmailAuthProvider.credential(
        email: user!.email!,
        password: password,
      );
      await user.reauthenticateWithCredential(credentials);
      await user.delete();
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
