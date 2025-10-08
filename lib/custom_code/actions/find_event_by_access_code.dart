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

Future<DocumentReference?> findEventByAccessCode(String accessCode) async {
  // Busca en la colección 'eventos' un documento con el código de acceso.
  final eventQuery = await FirebaseFirestore.instance
      .collection('eventos')
      .where('access_code', isEqualTo: accessCode)
      .limit(1)
      .get();

  // Si encuentra un evento, devuelve su referencia.
  if (eventQuery.docs.isNotEmpty) {
    return eventQuery.docs.first.reference;
  }

  // Si no encuentra nada, devuelve nulo.
  return null;
}
