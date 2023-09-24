import 'package:flutter/material.dart';
import 'package:miniproject/colors.dart';
import 'package:miniproject/screens/trackOrder.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

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
          "Orders",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 150),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 60, 0, 0),
              child: Row(
                children: [
                  Image.asset('assets/Images/A20 1.png'),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Your Parcel\n',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize:
                                20, // You can adjust the font size as needed
                          ),
                        ),
                        TextSpan(
                          text: 'Is On The Way',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                20, // You can adjust the font size as needed
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const TrackOrder()));
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80.0),
                    color: screenOneColor,
                  ),
                  alignment: Alignment.center,
                  height: 50.0,
                  width: 115,
                  child: const Text(
                    'Track Order',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
