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
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> manualCascadeDelete() async {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    // No hay usuario logueado, no se puede hacer nada.
    return false;
  }

  final firestore = FirebaseFirestore.instance;
  final userRef = firestore.collection('Usuario').doc(user.uid);

  try {
    // 1. Buscar y borrar todas las direcciones del usuario
    final addressesQuery =
        firestore.collection('direccion').where('owner', isEqualTo: userRef);
    final addressesSnapshot = await addressesQuery.get();

    // Usar un batch para borrar todo a la vez de forma eficiente
    WriteBatch batch = firestore.batch();
    for (var doc in addressesSnapshot.docs) {
      batch.delete(doc.reference);
    }

    // Aquí podrías añadir más consultas para borrar datos de otras colecciones (ej. eventos)

    await batch.commit();

    return true; // Limpieza exitosa
  } catch (e) {
    print('Error en el borrado manual en cascada: $e');
    return false; // Falló la limpieza
  }
}
