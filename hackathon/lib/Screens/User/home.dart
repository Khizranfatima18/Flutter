import 'package:flutter/material.dart';
import 'package:hackathon/Screens/Admin/adddonor.dart';
import 'package:hackathon/Screens/Admin/details.dart';
import 'package:hackathon/Screens/roleselection.dart';
import 'package:hackathon/Screens/User/userdetails.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color(0xffEB3738),
        title: Text('Address'),
        actions: [
            IconButton(
                icon: Icon(Icons
                    .exit_to_app), // Use the logout icon (you can choose a different icon if needed)
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RoleSelection()));
                })
          ]
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset('assets/Images/map.png'),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Align buttons in the center
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserDonorList()));
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.red, // Initial border color
                              ),
                              borderRadius: BorderRadius.circular(
                                  10), // Adjust border radius as needed
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              // Set the background color to red when pressed
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.red;
                              }
                              // Set the initial background color (none) when not pressed
                              return Colors.white;
                            },
                          ),
                        ),
                        child: Text(
                          'SHOW ALL',
                          style: TextStyle(color: Color(0xffEB3738)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
