import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackathon/Screens/Admin/adminhome.dart';
import 'package:hackathon/Screens/Admin/adminlogin.dart';
import 'package:hackathon/Screens/User/home.dart';

class AdminRegistrationPage extends StatefulWidget {
  @override
  _AdminRegistrationPageState createState() => _AdminRegistrationPageState();
}

class _AdminRegistrationPageState extends State<AdminRegistrationPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _registerAdmin() async {
    try {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();
      final pin = pinController.text.trim();

      if (email.isEmpty || password.isEmpty || pin.isEmpty) {
        // Handle invalid input
        return;
      }

      // Create a new user with email and password
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        // User registration successful
        final User user = userCredential.user!;

        // Set the user's role to "admin" in Firestore
        await setUserRoleInFirestore(user.uid, 'admin');

        // Save the pin code to Firestore
        await savePinCodeToFirestore(user.uid, pin);

        // Navigate to the home screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdminHome()),
        );
      } else {
        // Registration failed
        // Handle the error, e.g., show an error message
      }
    } catch (e) {
      // Handle exceptions and errors
    }
  }

  Future<void> setUserRoleInFirestore(String uid, String role) async {
    // Set the user's role to "admin" in Firestore
    // You can use the code I provided earlier for this function
  }

  Future<void> savePinCodeToFirestore(String uid, String pin) async {
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');

    try {
      await usersCollection.doc(uid).set({
        'pinCode': pin, // Save the pin code during registration
      }, SetOptions(merge: true));
      print('Pin code saved to Firestore');
    } catch (e) {
      print('Error saving pin code to Firestore: $e');
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
                    "MANAGER",
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
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10), // Adjust border radius as needed
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: _registerAdmin,
                      child: const Text("SAVE"),
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
            top:700, // Adjust this value to position it below the login container
            left: 130, // Adjust this value to center it
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminLoginPage()),
                );
              },
              child: const Text(
                "Back to LOGIN ",
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
}
