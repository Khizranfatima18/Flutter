import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miniproject/screens/homeScreen.dart';
import '../colors.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<dynamic> screenData = [
    {
      "Text": 'Your holiday shopping delivered to screen One ',
      "Image": 'assets/Images/Emoji.png',
      "belowText":
          'Theres something for everyone to enjoy with Sweet shop Favourites Screen 1',
      "ImageIcon": 'assets/Images/icon.png',
    },
    {
      "Text": 'Your holiday shopping delivered to screen Two ',
      "Image": 'assets/Images/Emoji.png',
      "belowText":
          'Theres something for everyone to enjoy with Sweet shop Favourites Screen 2',
      "ImageIcon": 'assets/Images/icon.png',
    }
  ];
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: screenOneColor,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              itemCount: screenData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(33, 100, 60, 0),
                  child: Column(
                    children: [
                      Text(
                        screenData[index]['Text'],
                        style: const TextStyle(
                          fontSize: 40,
                          color: Color.fromARGB(255, 248, 247, 247),
                          fontFamily: 'Manrope',
                        ),
                      ),
                      Image.asset(screenData[index]['Image']),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        screenData[index]['belowText'],
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 248, 247, 247),
                          fontFamily: 'TulpenOne',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Image.asset(screenData[index]['ImageIcon']),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 10.0,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffFAFBFD),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xff1E222B),
                      ),
                    ),
                    SizedBox(width: 15.0),
                    Icon(Icons.arrow_forward_sharp, color: Color(0xff1E222B)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}