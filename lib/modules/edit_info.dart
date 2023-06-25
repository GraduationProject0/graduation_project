import 'package:cloud_firestore/cloud_firestore.dart';

Future<Map<String, dynamic>?> updateInfo(
    String docId, String eemail, String pphone, String birth) async {
  try {
    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('users');
    final Map<String, dynamic> newData =
        {}; // Create an empty map to store the new data

    if (eemail != '') {
      newData['E-Mail'] = eemail; // Add email field to the new data map
    }
    if (pphone != '') {
      newData['Phone'] = pphone; // Add phone field to the new data map
    }
    if (birth != '') {
      newData['Birth'] = birth; // Add birth field to the new data map
    }

    await collectionRef
        .doc(docId)
        .update(newData); // Update the document with the new data

    print('Document with ID $docId updated successfully!');

    // Fetch the updated document data and return it
    final DocumentSnapshot updatedSnapshot =
        await collectionRef.doc(docId).get();
    final Map<String, dynamic> updatedData =
        updatedSnapshot.data() as Map<String, dynamic>;

    // Extract email, phone, and birth from the updated data
    final String? updatedEmail = updatedData['E-Mail'] as String?;
    final String? updatedPhone = updatedData['Phone'] as String?;
    final String? updatedBirth = updatedData['Birth'] as String?;

    // Return the updated data
    return {
      'email': updatedEmail,
      'phone': updatedPhone,
      'birth': updatedBirth,
    };
  } catch (e) {
    print('Error updating document: $e');
    return null; // Return null or handle the error case accordingly
  }
}

Future<void> updatepass(String docId, String password, String confirm) async {
  try {
    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('users');
    final Map<String, dynamic> newData =
        {}; // Create an empty map to store the new data
    if (password == confirm) {
      if (password != '') {
        newData['Password'] = password; // Add email field to the new data map
      }
    }
    await collectionRef
        .doc(docId)
        .update(newData); // Update the document with the new data

    print('Document with ID $docId updated pass successfully!');
  } catch (e) {
    print('Error updating pass document: $e');
  }
}
