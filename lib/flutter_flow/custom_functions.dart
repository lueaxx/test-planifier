import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ff_commons/flutter_flow/lat_lng.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import 'package:ff_commons/flutter_flow/uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String getInitials(String displayName) {
  // Retorna '?' si el nombre está vacío
  if (displayName.trim().isEmpty) {
    return '?';
  }
  // Divide el nombre en palabras, eliminando posibles espacios extra
  List<String> words =
      displayName.trim().split(' ').where((s) => s.isNotEmpty).toList();

  if (words.isEmpty) {
    return '?';
  }

  // Toma la primera letra de la primera palabra
  String firstInitial = words.first[0];

  // Si hay más de una palabra, toma la primera letra de la última palabra
  String lastInitial = words.length > 1 ? words.last[0] : '';

  return (firstInitial + lastInitial).toUpperCase();
}

String formatMonthAbbreviation(DateTime? date) {
  if (date == null) {
    return '';
  }
  const List<String> meses = [
    'ENE',
    'FEB',
    'MAR',
    'ABR',
    'MAY',
    'JUN',
    'JUL',
    'AGO',
    'SEP',
    'OCT',
    'NOV',
    'DIC'
  ];
  // date.month es 1-12, el índice de la lista es 0-11.
  return meses[date.month - 1];
}

String generateEventCode() {
  var rng = math.Random();
  // Genera un número aleatorio de 6 dígitos (entre 100000 y 999999)
  return (100000 + rng.nextInt(900000)).toString();
}
