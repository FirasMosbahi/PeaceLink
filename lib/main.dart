import 'package:PeaceLink/core/view-models/chat_view_model.dart';
import 'package:PeaceLink/core/view-models/donation_view_model.dart';
import 'package:PeaceLink/core/view-models/idea_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Ui/screens/first_splach_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider<ChatProvider>(
      create: (_) => ChatProvider(),
      child: ChangeNotifierProvider<DonationProvider>(
        create: (_) => DonationProvider(),
        child: ChangeNotifierProvider<IdeaProvider>(
          create: (_) => IdeaProvider(),
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: FirstSplach(),
          ),
        ),
      ),
    ),
  );
}
