import 'package:flutter/material.dart';

class TrackOrder extends StatelessWidget {
  const TrackOrder({super.key});

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
          "Track Orders",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.asset('assets/Images/map.png'),
          ),
         const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 120),
            child: Image.asset('assets/Images/Details (1).png'),
          ),
        ],
      ),
    );
  }
}