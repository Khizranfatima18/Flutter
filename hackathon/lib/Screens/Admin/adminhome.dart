import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/Screens/Admin/adminlogin.dart';
import 'package:hackathon/Screens/Admin/details.dart';
import 'package:hackathon/Screens/Admin/managerlist.dart';
import 'package:hackathon/Screens/roleselection.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor:
              const Color(0xffEB3738), // Set the app bar background color
          title: const Text(
            'Welcom To Zindagi..',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          toolbarHeight: 80,
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
          ]),
      body: Stack(
        children: [
          Container(
            height: 260,
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
                  topLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
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
              height: 260,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DonorList()));
                                },
                                icon: const Icon(Icons.people_alt_rounded,
                                    size: 40),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'View Donors',
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ManagerScreen()));
                                },
                                icon: const Icon(Icons.manage_accounts_rounded,
                                    size: 40),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'View Managers',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Row(
                        children: [
                          const SizedBox(width: 20),
                          IconButton(
                            onPressed: () {
                              // Add your onPressed logic here
                            },
                            icon: const Icon(Icons.manage_accounts_rounded,
                                size: 48),
                          ),
                          const SizedBox(width: 15),
                          const Text(
                            'Complains',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 50, // Adjust this value to move the image up or down
            left: 120, // Adjust this value to move the image left or right
            child: Image.asset(
              'assets/Images/icon.png',
              height: 100,
              width: 110,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 475, 5, 0),
            child: bannerCard(),
          )
        ],
      ),
    );
  }

  Widget bannerCard() {
    return CarouselSlider(
      items: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: const Color.fromARGB(255, 59, 4, 4),
              style: BorderStyle.solid,
            ),
            image: const DecorationImage(
              image: AssetImage('assets/Images/im.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: const Color.fromARGB(255, 59, 4, 4),
              style: BorderStyle.solid,
            ),
            image: const DecorationImage(
              image: AssetImage('assets/Images/image2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: const Color.fromARGB(255, 59, 4, 4),
              style: BorderStyle.solid,
            ),
            image: const DecorationImage(
              image: AssetImage('assets/Images/im3.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Add more images as needed
      ],
      options: CarouselOptions(
        height: 200.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
    );
  }
}
