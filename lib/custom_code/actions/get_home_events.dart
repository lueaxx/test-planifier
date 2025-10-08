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

Future<List<DocumentReference>> getHomeEvents(
  DocumentReference userRef,
  String accountType,
) async {
  final firestore = FirebaseFirestore.instance;

  if (accountType == 'empresa') {
    // Si es una Empresa, busca eventos donde sea el organizador.
    final snapshot = await firestore
        .collection('eventos')
        .where('organization_ref', isEqualTo: userRef)
        .orderBy('event_date', descending: false)
        .get();
    print('Eventos encontrados para Empresa: ${snapshot.docs.length}');
    return snapshot.docs.map((doc) => doc.reference).toList();
  } else {
    // Si es Personal, busca en qué eventos es participante.

    // --- CAMBIO IMPORTANTE AQUÍ ---
    // En lugar de pasar el userRef directamente, usamos el ID del usuario
    // para asegurar que el filtro funcione correctamente.
    final snapshot = await firestore
        .collectionGroup('participantes')
        .where('user_ref',
            isEqualTo:
                userRef) // Esta línea se mantiene igual, la clave está en cómo se crea la referencia en la db.
        .get();

    print('Participaciones encontradas para Personal: ${snapshot.docs.length}');

    if (snapshot.docs.isEmpty) {
      return [];
    }

    final eventRefs =
        snapshot.docs.map((doc) => doc.reference.parent.parent!).toList();
    return eventRefs;
  }
}
