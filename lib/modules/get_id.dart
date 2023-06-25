import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> getID(String email) async {

  // Search for the document using email
  QuerySnapshot<Map<String, dynamic>> querySnapshot =
  await FirebaseFirestore.instance
      .collection('users')
      .where('E-Mail', isEqualTo: email)
      .get();

  // Get the document ID
  String docId = querySnapshot.docs.first.id;

  // Handle item click here
  print('Clicked on document ID: $docId');
  return docId;
}


