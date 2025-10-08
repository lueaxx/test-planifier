// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';

Future<bool> reauthenticateUser(String currentPassword) async {
  try {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null || user.email == null) {
      return false;
    }

    // Crea la credencial con el email del usuario y la contraseña que ingresó
    AuthCredential credential = EmailAuthProvider.credential(
      email: user.email!,
      password: currentPassword,
    );

    // Intenta reautenticar. Si la contraseña es incorrecta, esto lanzará un error.
    await user.reauthenticateWithCredential(credential);
    return true; // Éxito, la contraseña actual es correcta
  } catch (e) {
    // El error más común es 'wrong-password'
    print('Error de reautenticación: $e');
    return false; // Falló, la contraseña actual es incorrecta
  }
}
