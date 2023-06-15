import 'package:cloud_firestore/cloud_firestore.dart';
//import 'database.dart';
FirebaseFirestore db = FirebaseFirestore.instance;

Future<bool> addUsers(
    String Fname,
    String Lname,
    String email,
    String phone,
    String birth,
    String password,
    String confirmPassword )async {

  bool isAdded = false;

  // String gender ="";

  // if (genderVal == 1)
  // {
  //   gender = "Male";
  // }
  // else if (genderVal == 2)
  // {
  //   gender = "Female";
  // }

  QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
      .collection('users')
      //.where('Phone', isEqualTo: phone)
      .where('E-Mail', isEqualTo: email)
      .get();

  if (querySnapshot.size == 0 && password==confirmPassword) {

    // if(name != "" && email != "" && phone != "" && birth != "")
    // {
      final user = <String, dynamic>{
        "FName": Fname,
        "LName": Lname,
        "E-Mail": email,
        "Phone": phone,
        "Birth": birth,
        "Password": password,

      };

      db.collection("users").add(user);
      isAdded = true;

    // }

  }
  else{
    isAdded = false;
  }

  return isAdded;
}