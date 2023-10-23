
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:hackathon/Screens/Admin/adminhome.dart';
// import 'package:hackathon/Screens/home.dart';
// import 'package:hackathon/Screens/register.dart';

// class Practice extends StatefulWidget {
//   const Practice({super.key});

//   @override
//   State<Practice> createState() => _PracticeState();
// }

// class _PracticeState extends State<Practice> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   Future<void> signInWithEmailAndPassword() async {
//     try {
//       final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: emailController.text,
//         password: passwordController.text,
//       );
//       final User? user = userCredential.user;
//       if (user != null) {
//         // Now, retrieve the user role from Firestore based on the user's UID
//         final String userRole = await getUserRoleFromFirestore(user.uid);

//         if (userRole == 'admin') {
//           // Navigate to the admin home screen
//           Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminHome()));
//         } else {
//           // Navigate to the regular user home screen
//           Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
//         }
//       }
//     } catch (e) {
//       // Handle authentication errors (e.g., invalid email or password).
//       print('Error: $e');
//     }
//   }

// Future<String> getUserRoleFromFirestore(String userUid) async {
//   try {
//     final DocumentSnapshot userDoc =
//         await FirebaseFirestore.instance.collection('users').doc(userUid).get();

//     if (userDoc.exists) {
//       final dynamic data = userDoc.data();
//       if (data != null && data['role'] is String) {
//         final String role = data['role'] as String;
//         if (role == 'admin' || role == 'user') {
//           return role;
//         } else {
//           return 'user';
//         }
//       }
//     }
//     return 'user';
//   } catch (e) {
//     print('Error fetching user role: $e');
//     return 'user';
//   }
// }

//   @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Center(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Your existing UI components for the login screen
//             TextField(
//               controller: emailController,
//               decoration: const InputDecoration(labelText: 'Email'),
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               controller: passwordController,
//               decoration: const InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: signInWithEmailAndPassword,
//               child: const Text('Login'),
//             ),
//             // The "Don't have an account?" text
//             Positioned(
//               top: 700,
//               left: 80,
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const RegisterScreen()),
//                   );
//                 },
//                 child: const Text(
//                   "Don't have an account? Register now",
//                   style: TextStyle(
//                     color: Colors.black,
//                     decoration: TextDecoration.underline,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
// }