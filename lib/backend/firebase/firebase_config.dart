import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC69xnn6ydzptLZrmkHoEBI63SenP3adyA",
            authDomain: "park-and-drive.firebaseapp.com",
            projectId: "park-and-drive",
            storageBucket: "park-and-drive.appspot.com",
            messagingSenderId: "428939713167",
            appId: "1:428939713167:web:4270ea2190a21a39eeeefa",
            measurementId: "G-68EJP4JDEF"));
  } else {
    await Firebase.initializeApp();
  }
}
