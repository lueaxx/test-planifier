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

import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> requestToJoinEvent(
  DocumentReference eventRef,
  DocumentReference userRef,
  String userName,
  String userEmail,
) async {
  try {
    // Define la ruta al documento del participante usando su UID.
    final participantDocRef =
        eventRef.collection('participantes').doc(userRef.id);

    // 1. Revisa si el usuario ya existe en la subcolección.
    final participantDoc = await participantDocRef.get();
    if (participantDoc.exists) {
      // El usuario ya es miembro, por lo tanto, la operación no es "exitosa".
      return false;
    }

    // 2. Si no existe, crea la solicitud de ingreso.
    await participantDocRef.set({
      'user_ref': userRef,
      'display_name': userName,
      'email': userEmail,
      'status': 'pending',
      'role': null,
      'added_at': FieldValue.serverTimestamp(),
    });

    // La solicitud fue creada con éxito.
    return true;
  } catch (e) {
    // Si ocurre cualquier error, devuelve falso.
    print('Error en requestToJoinEvent: $e');
    return false;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
