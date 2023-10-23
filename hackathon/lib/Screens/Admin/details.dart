import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/Screens/Admin/adddonor.dart';
import 'package:hackathon/Screens/Admin/editdonor.dart';

class DonorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference donorsCollection =
        FirebaseFirestore.instance.collection('donors');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffEB3738),
        title: const Text('All Donors'),
        toolbarHeight: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddDonorScreen(),
                ),
              ),
              backgroundColor: Colors.red, // Set the background color to red
              child: Icon(Icons.add), // Add the "+" icon
            ),
          ),
        ],
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: donorsCollection.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('No donors found.'));
            }

            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final donorData =
                    snapshot.data!.docs[index].data() as Map<String, dynamic>;

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Hero(
                          tag: 'donor_${donorData['uid']}', // Unique tag for the widget
                          child: EditDonorScreen(donorData: donorData),
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: ListTile(
                        title: Text(
                          donorData['name'] ?? '',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Text('Blood Group: ${donorData['bloodGroup'] ?? ''}'),
                            const SizedBox(
                              height: 5,
                            ),
                            Text('Contact Number: ${donorData['contactNumber'] ?? ''}'),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
