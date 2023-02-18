import 'package:chat_for_peace/Ui/screens/first_splach_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
     const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstSplach(),
    ),
  );
}
