import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddDonorScreen extends StatefulWidget {
  const AddDonorScreen({super.key});

  @override
  _AddDonorScreenState createState() => _AddDonorScreenState();
}

class _AddDonorScreenState extends State<AddDonorScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bloodGroupController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();

  Future<void> addDonor() async {
    String name = nameController.text;
    String bloodGroup = bloodGroupController.text;
    String contactNumber = contactNumberController.text;

    await FirebaseFirestore.instance.collection('donors').add({
      'name': name,
      'bloodGroup': bloodGroup,
      'contactNumber': contactNumber,
      'timestamp': FieldValue.serverTimestamp(), // Add a timestamp for the record
    });

    nameController.clear();
    bloodGroupController.clear();
    contactNumberController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Donor added successfully'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: const Color(0xffEB3738),
        title: Text('Add Donor'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(25.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  TextField(
                    controller: bloodGroupController,
                    decoration: InputDecoration(labelText: 'Blood Group'),
                  ),
                  TextField(
                    controller: contactNumberController,
                    decoration: InputDecoration(labelText: 'Contact Number'),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Image.asset('assets/Images/Mask group (2).png'),
                  const SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
              onPressed: addDonor,
              child: Text('Add Donor'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffEB3738)), // Set the color to red
              ),
            ),
            
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
