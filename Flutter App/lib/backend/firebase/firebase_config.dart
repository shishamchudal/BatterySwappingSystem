import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB4DN9zT2gq7BhE_bcDE1I7r0RjseBC1SE",
            authDomain: "pbsbss-6b3f5.firebaseapp.com",
            projectId: "pbsbss-6b3f5",
            storageBucket: "pbsbss-6b3f5.appspot.com",
            messagingSenderId: "845839108778",
            appId: "1:845839108778:web:9b17d811f212fc860eded3",
            measurementId: "G-YC4EB4RB9L"));
  } else {
    await Firebase.initializeApp();
  }
}
