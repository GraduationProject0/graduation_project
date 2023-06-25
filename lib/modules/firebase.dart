import 'package:cloud_firestore/cloud_firestore.dart';

//import 'database.dart';
FirebaseFirestore db = FirebaseFirestore.instance;

Future<bool> addUsers(
    String add_Fname,
    String add_Lname,
    String add_email,
    String add_phone,
    String add_birth,
    String add_password,
    String add_confirmPassword) async {
  bool isAdded = false;

  QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
      .instance
      .collection('users')
      .where('E-Mail', isEqualTo: add_email)
      .get();

  if (querySnapshot.size == 0 && add_password == add_confirmPassword) {
    final user = <String, dynamic>{
      "FName": add_Fname,
      "LName": add_Lname,
      "E-Mail": add_email,
      "Phone": add_phone,
      "Birth": add_birth,
      "Password": add_password,
    };

    db.collection("users").add(user);
    isAdded = true;
  } else {
    isAdded = false;
    print("not added");
  }

  return isAdded;
}
