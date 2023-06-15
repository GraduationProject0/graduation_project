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

// Future<void> checkLoginStatus() async {
//   String? loginAccount = await getLoginAccountFromCache();
//   if (loginAccount != null) {
//     print('Login account retrieved from cache: $loginAccount');
//   } else {
//     print('No login account found in cache.');
//   }
// }


Future<void> removeLoginAccountFromCache() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('loginAccount');
  print('Login account removed from cache');
}