import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/Screens/User/home.dart';
import 'package:hackathon/Screens/User/login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  Future<void> registerWithEmailAndPassword() async {
    if (passwordController.text == confirmPasswordController.text) {
      try {
        final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        final User? user = userCredential.user;
        if (user != null) {
          // Set the user's role to "user" in Firestore during registration.
          await setUserRoleInFirestore(user.uid, 'user');

          // Save user data to Firestore
          await saveUserDataToFirestore(user.uid);

          // Navigate to the user's home screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }
      } catch (e) {
        // Handle registration errors (e.g., email already in use, weak password).
        print('Error: $e');
      }
    } else {
      // Passwords do not match, handle this case.
      print('Error: Passwords do not match');
    }
  }

  Future<void> saveUserDataToFirestore(String uid) async {
    CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

    try {
      await usersCollection.doc(uid).set({
        'email': emailController.text,
        // You can add more user data here
      });
      print('User data saved to Firestore');
    } catch (e) {
      print('Error saving user data to Firestore: $e');
    }
  }

  Future<void> setUserRoleInFirestore(String uid, String role) async {
    CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

    try {
      await usersCollection.doc(uid).set({
        'role': role, // Set the user's role during registration
      }, SetOptions(merge: true));
      print('User role set to $role in Firestore');
    } catch (e) {
      print('Error setting user role in Firestore: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 300,
            decoration: const BoxDecoration(
              color: Color(0xffEB3738),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                ),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 7,
                    color: Colors.grey,
                    spreadRadius: 2,
                  ),
                ],
              ),
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "REGISTER",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: confirmPasswordController,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: registerWithEmailAndPassword,
                      child: const Text("REGISTER"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xffEB3738),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 120,
            child: Image.asset(
              'assets/Images/icon.png',
              height: 70,
              width: 100,
            ),
          ),
          Positioned(
            top: 700,
            left: 80,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text(
                "Already have an account? Sign in",
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}