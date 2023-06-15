import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updateInfo(String docId, String email, String phone, String birth) async {
  try {
    final CollectionReference collectionRef = FirebaseFirestore.instance.collection('users');
    final Map<String, dynamic> newData = {}; // Create an empty map to store the new data

    if (email != '') {
      newData['E-Mail'] = email; // Add email field to the new data map
    }
    if (phone != '') {
      newData['Phone'] = phone; // Add phone field to the new data map
    }
    if (birth != '') {
      newData['Birth'] = birth; // Add birth field to the new data map
    }

    await collectionRef.doc(docId).update(newData); // Update the document with the new data

    print('Document with ID $docId updated successfully!');
  } catch (e) {
    print('Error updating document: $e');
  }
}

Future<void> updatepass(String docId, String password, String confirm) async {
  try {
    final CollectionReference collectionRef = FirebaseFirestore.instance.collection('users');
    final Map<String, dynamic> newData = {}; // Create an empty map to store the new data
    if(password==confirm){
      if (password != '') {
        newData['Password'] = password; // Add email field to the new data map
      }
    }
    await collectionRef.doc(docId).update(newData); // Update the document with the new data

    print('Document with ID $docId updated pass successfully!');
  } catch (e) {
    print('Error updating pass document: $e');
  }
}
// Future<void> updatePassword(String docId, String password, String confirm) async {
//   try {
//     if (password == confirm) {
//       final CollectionReference collectionRef =
//       FirebaseFirestore.instance.collection('users');
//       final Map<String, dynamic> newData = {}; // Create an empty map to store the new data
//
//       if (password != '') {
//         newData['Password'] = password; // Add the password field to the new data map
//       }
//
//       await collectionRef.doc(docId).update(newData); // Update the document with the new data
//
//       print('Document with ID $docId updated password successfully!');
//     } else {
//       print('Password and confirm password do not match!');
//     }
//   } catch (e) {
//     print('Error updating password document: $e');
//   }
// }

