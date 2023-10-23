import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditDonorScreen extends StatefulWidget {
  final Map<String, dynamic> donorData;

  EditDonorScreen({required this.donorData});

  @override
  _EditDonorScreenState createState() => _EditDonorScreenState();
}

class _EditDonorScreenState extends State<EditDonorScreen> {
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
        title: const Text('Edit Donor'),
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
            ElevatedButton(
              onPressed: () {
                // Reference the document by its ID (uid)
                final documentReference = FirebaseFirestore.instance
                    .collection('donors')
                    .doc(widget.donorData['uid']);

                // Before the documentReference.get() call, print the UID to check its value.
                print('Document UID to update: ${widget.donorData['uid']}');

                // Check if the document exists before updating it
                documentReference.get().then((doc) {
                  if (doc.exists) {
                    // Document exists, update the data
                    documentReference.update({
                      'name': nameController.text,
                      'bloodGroup': bloodGroupController.text,
                      'contactNumber': contactNumberController.text,
                    }).then((_) {
                      _showSnackbar('Changes saved successfully.');

                      // Navigate back to the donor list screen
                      Navigator.of(context).pop();
                    }).catchError((error) {
                      _showSnackbar('Error saving changes: $error');
                    });
                  } else {
                    // Document does not exist, handle it (e.g., show an error message)
                    _showSnackbar('Document not found. Cannot update.');
                  }
                });
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
