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



Future<String?> getEmail(String id) async {
  final DocumentSnapshot snapshot =
  await FirebaseFirestore.instance.collection('users').doc(id).get();

  if (snapshot.exists) {
    final data = snapshot.data() as Map<String, dynamic>?; // Cast data to nullable Map
    if (data != null) {
      final email = data['E-Mail'] as String?;
      return email;
    }
  }

  return null; // Document does not exist or email field is not found
}

Future<String?> getphone(String id) async {
  final DocumentSnapshot snapshot =
  await FirebaseFirestore.instance.collection('users').doc(id).get();

  if (snapshot.exists) {
    final data = snapshot.data() as Map<String, dynamic>?; // Cast data to nullable Map
    if (data != null) {
      final phone = data['Phone'] as String?;
      return phone;
    }
  }

  return null; // Document does not exist or email field is not found
}
Future<String?> getbirth(String id) async {
  final DocumentSnapshot snapshot =
  await FirebaseFirestore.instance.collection('users').doc(id).get();

  if (snapshot.exists) {
    final data = snapshot.data() as Map<String, dynamic>?; // Cast data to nullable Map
    if (data != null) {
      final birth = data['Birth'] as String?;
      return birth;
    }
  }

  return null; // Document does not exist or email field is not found
}


// Future<String?> getFullName(String id) async {
//   final DocumentSnapshot snapshot =
//   await FirebaseFirestore.instance.collection('users').doc(id).get();
//
//   if (snapshot.exists) {
//     final data = snapshot.data() as Map<String, dynamic>?; // Cast data to nullable Map
//     if (data != null) {
//       final firstName = data['FName'] as String?;
//       final lastName = data['LName'] as String?;
//       if (firstName != null && lastName != null) {
//         String fullName = '$firstName $lastName';
//         return fullName;
//       }
//     }
//   }
//
//   return null; // Document does not exist or first name/last name fields are not found
// }





// import 'package:cloud_firestore/cloud_firestore.dart';
//
// Future<void> updateUserInformation(String email, String newName) async {
//   try {
//     final QuerySnapshot snapshot = await FirebaseFirestore.instance
//         .collection('users')
//         .where('email', isEqualTo: email)
//         .get();
//
//     if (snapshot.size == 1) {
//       final DocumentSnapshot document = snapshot.docs[0];
//       final String documentId = document.id;
//
//       await FirebaseFirestore.instance
//           .collection('users')
//           .doc(documentId)
//           .update({'name': newName});
//
//       print('User information updated successfully');
//     } else {
//       print('User not found');
//     }
//   } catch (e) {
//     print('Error updating user information: $e');
//   }
// }


// import 'package:cloud_firestore/cloud_firestore.dart';
// //
Future<String> getUserFullName(String email) async {
  final QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('users')
      .where('E-Mail', isEqualTo: email)
      .get();

  if (snapshot.size == 1) {
    DocumentSnapshot document = snapshot.docs[0];
    String firstName = document.get('FName') ?? '';
    String lastName = document.get('LName') ?? '';
    String fullName = '$firstName $lastName';

    return fullName;
  } else {
    return 'User not found';
  }
}

Future<String> getUserphone(String email) async {
  final QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('users')
      .where('E-Mail', isEqualTo: email)
      .get();

  if (snapshot.size == 1) {
    DocumentSnapshot document = snapshot.docs[0];
    String phone = document.get('Phone') ?? '';


    return phone;
  } else {
    return 'User not found';
  }
}


Future<String> getUserbirth(String email) async {
  final QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('users')
      .where('E-Mail', isEqualTo: email)
      .get();

  if (snapshot.size == 1) {
    DocumentSnapshot document = snapshot.docs[0];

    String birth = document.get('Birth') ?? '';


    return birth;
  } else {
    return 'User not found';
  }
}

