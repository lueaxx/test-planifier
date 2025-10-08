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

Future<String> confirmarPasswordReset(
  BuildContext context,
  String oobCode,
  String newPassword,
) async {
  // Esta acción devuelve un String para identificar el resultado.
  try {
    await FirebaseAuth.instance.confirmPasswordReset(
      code: oobCode,
      newPassword: newPassword,
    );
    // Si tiene éxito, devuelve 'SUCCESS'
    return 'SUCCESS';
  } on FirebaseAuthException catch (e) {
    // Si falla, devuelve un código de error específico.
    if (e.code == 'weak-password') {
      return 'WEAK_PASSWORD';
    } else {
      return 'INVALID_CODE'; // Para 'invalid-action-code', 'expired-action-code', etc.
    }
  }
}
