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

Future<void> addOrInviteParticipants(
  DocumentReference eventRef,
  List<String> emailsToInvite,
  String roleToAdd,
) async {
  final firestore = FirebaseFirestore.instance;
  final batch = firestore.batch();
  final usersCollection = firestore.collection('Usuario');

  for (final email in emailsToInvite) {
    // Paso 1: Busca si ya existe un usuario con ese email.
    final userQuery = await usersCollection
        .where('email', isEqualTo: email.trim())
        .limit(1)
        .get();

    final participantDocRef = eventRef.collection('participantes').doc();

    if (userQuery.docs.isNotEmpty) {
      // CASO 1: El usuario YA EXISTE.
      final existingUser = userQuery.docs.first;
      batch.set(participantDocRef, {
        'email': email.trim(),
        'status': 'activo', // Se añade como activo directamente
        'role': roleToAdd,
        'user_ref': existingUser.reference, // Se añade su referencia
        'display_name': existingUser.data()['display_name'],
        'added_at': FieldValue.serverTimestamp(),
      });
    } else {
      // CASO 2: El usuario NO EXISTE.
      batch.set(participantDocRef, {
        'email': email.trim(),
        'status': 'invitado', // Se crea una invitación
        'role': roleToAdd,
        'user_ref': null,
        'added_at': FieldValue.serverTimestamp(),
      });
    }
  }
  // Ejecuta todas las operaciones a la vez.
  await batch.commit();
}
