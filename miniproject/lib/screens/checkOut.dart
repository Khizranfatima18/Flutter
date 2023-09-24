import 'package:flutter/material.dart';
import 'package:miniproject/colors.dart';
import 'package:miniproject/screens/orders.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
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
          "Shopping Cart",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                child: Text(
                          "Delivery Address",
                          style: TextStyle(fontFamily: 'Manrope', fontSize: 20,fontWeight: FontWeight.bold),
                        ),
              ),),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.asset('assets/Images/TextIcon.png'),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset('assets/Images/Stock (2).png'),
          const SizedBox(
            height: 10,
          ),
          Image.asset('assets/Images/Add Button.png'),
        ],
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Payment Successful'),
              duration: Duration(seconds: 2),
            ),
          );
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Orders()));
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
            child: const Text(
              'Make Payment',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
