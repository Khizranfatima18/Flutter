import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/Screens/Admin/adminhome.dart';
import 'package:hackathon/Screens/User/login.dart';
import 'package:hackathon/Screens/roleselection.dart';
import 'package:hackathon/Screens/splashscreen.dart';
import 'package:hackathon/firebase_options.dart';
import 'package:hackathon/pra.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
