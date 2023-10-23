
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/Screens/User/home.dart';
import 'package:hackathon/Screens/User/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
  try {
    final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    final User? user = userCredential.user;
    if (user != null) {
      // Check if the user's role is not already set to "user."
      final String userRole = await getUserRoleFromFirestore(user.uid);
      if (userRole != 'user') {
        // Update the user's role to "user" in Firestore.
        await updateUserRoleInFirestore(user.uid, 'user');
      }

      // Now, you can navigate to the regular user home screen.
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  } catch (e) {
    // Handle authentication errors (e.g., invalid email or password).
    print('Error: $e');
  }
}

Future<void> updateUserRoleInFirestore(String userUid, String newRole) async {
  try {
    // Reference to the user's document in Firestore
    final DocumentReference userDocRef =
        FirebaseFirestore.instance.collection('users').doc(userUid);

    // Update the 'role' field with the new role
    await userDocRef.update({'role': newRole});

    print('User role updated to $newRole');
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
                    controller: emailController, // Connect the controller to the email input field
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: passwordController, // Connect the controller to the password input field
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10), // Adjust border radius as needed
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: signInWithEmailAndPassword, // Call the sign-in method
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
            top: 120, // Adjust this value to move the image up or down
            left: 120, // Adjust this value to move the image left or right
            child: Image.asset(
              'assets/Images/icon.png',
              height: 70,
              width: 100,
            ),
          ),
          // Position the "Don't have an account?" text below the login container
          Positioned(
            top: 700, // Adjust this value to position it below the login container
            left: 80, // Adjust this value to center it
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterScreen()),
                );
              },
              child: const Text(
                "Don't have an account? Register now",
                style: TextStyle(
                  color: Colors.black, // Set the text color to blue
                  decoration: TextDecoration.underline, // Add an underline to the text
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
    // Reference to the user's document in Firestore
    final DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if (userDoc.exists) {
      // Get the 'role' field from the user's document
      final Map<String, dynamic>? userData = userDoc.data() as Map<String, dynamic>?;
      if (userData != null) {
        final String? userRole = userData['role'] as String?;
        if (userRole != null) {
          return userRole;
        }
      }
    }
  } catch (e) {
    print('Error fetching user role from Firestore: $e');
  }

  // Return a default role (e.g., 'user') if any error occurs or the role is not found
  return 'user';
}

}