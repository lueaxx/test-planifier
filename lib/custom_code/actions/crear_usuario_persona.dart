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

// Imports necesarios que debes añadir manualmente
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> crearUsuarioPersona(
  String email,
  String password,
  String nombre,
  String apellido,
  String phoneNumber,
  String role,
) async {
  try {
    // Paso 1: Crear el usuario en Firebase Authentication
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    User? user = userCredential.user;

    if (user == null) {
      // Si por alguna razón el usuario no se crea, devuelve falso
      return false;
    }

    // Paso 2: Crear el documento en la colección 'Usuario' con los campos correctos
    await FirebaseFirestore.instance.collection('Usuario').doc(user.uid).set({
      'uid': user.uid,
      'email': email,
      'nombre': nombre,
      'apellido': apellido,
      'display_name': '$nombre $apellido',
      'phone_number': phoneNumber,
      'tipo_cuenta': role, // Se define el tipo de cuenta aquí
      'created_time': FieldValue.serverTimestamp(),
      'initial_sync_complete': false, // <-- LÍNEA NUEVA Y CRUCIAL

      // Importante: No se incluyen los campos de 'empresa'
    });

    return true; // Devuelve verdadero si todo fue exitoso
  } catch (e) {
    // Si algo sale mal (email duplicado, etc.), imprime el error y devuelve falso
    print('Error al crear usuario persona: $e');
    return false;
  }
}
