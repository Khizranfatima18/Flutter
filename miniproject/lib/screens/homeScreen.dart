import 'package:flutter/material.dart';
import 'package:miniproject/bottomNavi.dart';
import 'package:miniproject/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> xyz = [
    {
      "namefield": 'assets/Images/namefield.png',
      "searchbar": TextFormField(
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
            size: 26,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: 'Search Products or store',
        ),
      ),
      "text": 'assets/Images/Text.png',
      "Recommeded": 'Recommended',
    },
  ];
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Wrap your Scaffold with SingleChildScrollView
        child: Column(
          children: [
            SizedBox(
              height: 270,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                itemCount: xyz.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 200,
                    width: 400,
                    color: screenOneColor,
                    child: Column(
                      children: [
                        const Padding(padding: EdgeInsets.fromLTRB(5, 50, 5, 0)),
                        Image.asset(xyz[index]['namefield']),
                        const SizedBox(
                          height: 20,
                        ),
                        xyz[index]['searchbar'],
                        const SizedBox(
                          height: 30,
                        ),
                        Image.asset(xyz[index]['text']),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            bannerCard(),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 120, 0),
              child: Text(
                "Recommended",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Manrope',
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Image.asset('assets/Images/GroceryItem.png'),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }

  Widget bannerCard() {
    return CarouselSlider(
      items: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: const DecorationImage(
              image: AssetImage('assets/Images/Card.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
      options: CarouselOptions(
        height: 150.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
    );
  }
}
