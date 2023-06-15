import 'package:cloud_firestore/cloud_firestore.dart';

Future<String?> getEemail(String id) async {
  try {
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
  } catch (e) {
    print('Error retrieving email: $e');
    return null;
  }
}



Future<String?> gettFullName(String id) async {
  try {
    final DocumentSnapshot snapshot =
    await FirebaseFirestore.instance.collection('users').doc(id).get();

    if (snapshot.exists) {
      final data = snapshot.data() as Map<String, dynamic>?; // Cast data to nullable Map
      if (data != null) {
        final firstName = data['FName'] as String?;
        final lastName = data['LName'] as String?;
        String fullName = '$firstName $lastName';
        return fullName;
      }
    }

    return null; // Document does not exist or name fields are not found
  } catch (e) {
    print('Error retrieving full name: $e');
    return null;
  }
}