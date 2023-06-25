import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduation_project/modules/global_variable.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveLoginAccountToCache(String docId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('loginAccount', docId);
  print('Login account saved to cache: $docId');
}

Future<String?> getLoginAccountFromCache() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? docId = prefs.getString('loginAccount');
  if (docId != null) {
    print('Login account retrieved from cache: $docId');
  } else {
    print('No login account found in cache.');
  }
  return docId;
}

Future<Map<String, String>?> getUserDataFromCache(String x) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  DocumentSnapshot snapshot = await firestore.collection('users').doc(x).get();
  if (snapshot.exists) {
    Map<String, dynamic> userData = snapshot.data() as Map<String, dynamic>;

    // Retrieve the values from the document
    String? email = userData['E-Mail'];
    String? birth = userData['Birth'];
    String? fName = userData['FName'];
    String? lName = userData['LName'];
    String? phone = userData['Phone'];

    // Return the values as a map
    return {
      'E-Mail': email ?? '',
      'Birth': birth ?? '',
      'FName': fName ?? '',
      'LName': lName ?? '',
      'Phone': phone ?? '',
    };
  } else {
    print('No user found with the document ID: $x');
    return null;
  }
}

Future<List<String>> getUserData(String id) async {
  Map<String, String>? userData = await getUserDataFromCache(id);
  savedId = id;
  print(savedId);
  List<String>? values = userData!.values.toList();
  if (userData != null) {
    // setState(() {
    eemail = values[0];
    birth = values[1];
    fName = values[2];
    lName = values[3];
    phone = values[4];
    // });
  }
  return values;
}

Future<void> removeAllDataFromCache() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  print('All data removed from cache');
}

Future<void> saveEmailToCache(String email) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('email', email);
  print('Email ID saved to cache: $email');
}

Future<String?> getEmailAccountFromCache() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? email = prefs.getString('email');
  if (email != null) {
    print('email retrieved from cache: $email');
  } else {
    print('No email account found in cache.');
  }
  return email;
}
