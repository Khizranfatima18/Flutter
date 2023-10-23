import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class contactPage extends StatefulWidget {
  final Map<String, dynamic> donorData;

  contactPage({required this.donorData});

  @override
  _contactPageState createState() => _contactPageState();
}

class _contactPageState extends State<contactPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bloodGroupController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Initialize the text editing controllers with donor data
    nameController.text = widget.donorData['name'];
    bloodGroupController.text = widget.donorData['bloodGroup'];
    contactNumberController.text = widget.donorData['contactNumber'];
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Donor'),
        backgroundColor: const Color(0xffEB3738),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: bloodGroupController,
              decoration: const InputDecoration(labelText: 'Blood Group'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: contactNumberController,
              decoration: const InputDecoration(labelText: 'Contact Number'),
            ),
            const SizedBox(height: 20),
                            Image.asset('assets/Images/Mask group (2).png'),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                // Add your call functionality here
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Set the background color to red
              ),
              child: Text(
                'Call',
                style: TextStyle(
                    color: Colors.white), // Set the text color to white
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
