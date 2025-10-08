import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAd2gBRmajeXjFmU5Um3-lxw-KhoG0EJQ4",
            authDomain: "nexo-studio.firebaseapp.com",
            projectId: "nexo-studio",
            storageBucket: "nexo-studio.firebasestorage.app",
            messagingSenderId: "526419283550",
            appId: "1:526419283550:web:3b4d8fbf01fe3ea7f86ecf",
            measurementId: "G-SD53X8G658"));
  } else {
    await Firebase.initializeApp();
  }
}
