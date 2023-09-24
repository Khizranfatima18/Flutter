import 'package:flutter/material.dart';
import 'package:miniproject/screens/addToCart/cart_provider.dart';
import 'package:miniproject/screens/onBoardingScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => CartProvider(),
    child:  Builder(builder: (BuildContext context) {
      return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
    );
  }
  )
  );
  }
    }
    
