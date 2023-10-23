import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hackathon/Screens/roleselection.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const RoleSelection()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(color: Color(0xffEB3738)),
      child: Center(child: Image.asset('assets/Images/icon.png')),
    ));
  }
}
