import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackathon/Screens/Admin/adminhome.dart';
import 'package:hackathon/Screens/Admin/adminregister.dart';

class AdminLoginPage extends StatefulWidget {
  @override
  _AdminLoginPageState createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInWithEmailAndPassword() async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      final User? user = userCredential.user;
      if (user != null) {
        // Check if the user's role is not already set to "admin."
        final String userRole = await getUserRoleFromFirestore(user.uid);
        if (userRole != 'admin') {
          // Update the user's role to "admin" in Firestore.
          await updateUserRoleInFirestore(user.uid, 'admin');
        }

        // Now, you can navigate to the admin home screen.
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AdminHome()));
      }
    } catch (e) {
      // Handle authentication errors (e.g., invalid email or password).
      print('Error: $e');
    }
  }

  Future<void> updateUserRoleInFirestore(String userUid, String role) async {
    try {
      // Reference the user's document and update the role field to 'admin'.
      await FirebaseFirestore.instance.collection('users').doc(userUid).update({
        'role': role,
      });
    } catch (e) {
      print('Error updating user role: $e');
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
                  bottomRight: Radius.circular(20),
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
                    "LOGIN",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller:
                        emailController, // Connect the controller to the email input field
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller:
                        passwordController, // Connect the controller to the password input field
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: pinController,
                    decoration: const InputDecoration(labelText: 'Pin Code'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10), // Adjust border radius as needed
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed:
                          signInWithEmailAndPassword, // Call the sign-in method
                      child: const Text("SIGN IN"),
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
            top: 80, // Adjust this value to move the image up or down
            left: 120, // Adjust this value to move the image left or right
            child: Image.asset(
              'assets/Images/icon.png',
              height: 90,
              width: 100,
            ),
          ),
          // Position the "Don't have an account?" text below the login container
          Positioned(
            top:
                700, // Adjust this value to position it below the login container
            left: 80, // Adjust this value to center it
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AdminRegistrationPage()),
                );
              },
              child: const Text(
                "Don't have an account? Register now",
                style: TextStyle(
                  color: Colors.black, // Set the text color to blue
                  decoration:
                      TextDecoration.underline, // Add an underline to the text
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<String> getUserRoleFromFirestore(String uid) async {
    try {
      final DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      if (userDoc.exists) {
        final dynamic data = userDoc.data();
        if (data != null && data['role'] is String) {
          final String role = data['role'] as String;
          if (role == 'admin' || role == 'user') {
            return role;
          } else {
            return 'user';
          }
        }
      }
      return 'user'; // Default to 'user' if no role is found.
    } catch (e) {
      print('Error fetching user role: $e');
      return 'user';
    }
  }
}
