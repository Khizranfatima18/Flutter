import 'package:flutter/material.dart';
import 'package:hackathon/Screens/Admin/adminlogin.dart';
import 'package:hackathon/Screens/User/login.dart';

class RoleSelection extends StatelessWidget {
  const RoleSelection({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/Images/bg.jpg'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.3),
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminLoginPage()));
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            25.0), // Adjust the radius as needed
                        border: Border.all(
                          color: Colors.white,
                          style: BorderStyle.solid,
                          width: 2,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'ADMIN',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            25.0), // Adjust the radius as needed
                        border: Border.all(
                          color: Colors.white,
                          style: BorderStyle.solid,
                          width: 2,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'USER',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
