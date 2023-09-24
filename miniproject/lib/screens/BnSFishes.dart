import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BnSFishes extends StatelessWidget {
  BnSFishes({super.key});

  final List<Map<String, String>> BnSFishesDetails = [
    {
      "Category1": 'assets/Images/image1.png',
    },
    {
      "Category2": 'assets/Images/image 2.png',
    },
    {
      "Category3": 'assets/Images/image 3.png',
    },
    {
      "Category4": 'assets/Images/image 4.png',
    },
    {
      "Category5": 'assets/Images/image 5.png',
    },
    {
      "Category6": 'assets/Images/image1.png',
    },
    {
      "Category7": 'assets/Images/image1.png',
    },
    {
      "Category8": 'assets/Images/image 5.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            size: 16,
            color: Color(0xff1E222B),
          ),
        ),
        title: const Text(
          "Big & Small Fishes",
          style: TextStyle(
            color: Color(0xff1E222B),
            fontSize: 16,
          ),
        ),
        actions: const [
          Icon(
            Icons.search_off_outlined,
            color: Color(0xff1E222B),
          ),
          SizedBox(
            width: 20,
          ),
          Center(
            child: badges.Badge(
              badgeContent: Text(
                '0',
                style: TextStyle(color: Colors.white),
              ),
              badgeAnimation: badges.BadgeAnimation.rotation(
                  animationDuration: Duration(milliseconds: 300)),
              badgeStyle: badges.BadgeStyle(badgeColor: Color(0xffF9B023)),
              child: Icon(
                Icons.shopping_basket_outlined,
                color: Color(0xff1E222B),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
        backgroundColor: Colors.white70,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset('assets/Images/productdetails.png'),
          const SizedBox(
            height: 20,
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                childAspectRatio: 1.0,
                mainAxisSpacing: 5),
            itemCount: BnSFishesDetails.length, // Total number of items
            shrinkWrap: true, // Ensure the grid takes only the space it needs
            physics:
                const NeverScrollableScrollPhysics(), // Disable scrolling of the grid
            itemBuilder: (BuildContext context, int index) {
              final imagePath = BnSFishesDetails[index].values.first;
              return GridTile(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover, // Adjust the fit as needed
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
