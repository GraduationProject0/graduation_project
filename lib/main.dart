import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/modules/shared_preferences.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:graduation_project/modules/home/home.dart';
import 'package:graduation_project/modules/home/home_2.dart';
import 'package:graduation_project/modules/login/login.dart';
import 'package:graduation_project/modules/profile/profile.dart';
import 'package:graduation_project/modules/test/3d.dart';
import 'package:graduation_project/modules/test/test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //String? savedId = await getLoginAccountFromCache();
  runApp(MyApp());
  //runApp(MyApp(savedId));
  //getLoginAccountFromCache();
 // checkLoginStatus();
}

class MyApp extends StatelessWidget {
  // final String? savedId;
  // MyApp(this.savedId);
  //const MyApp(String? savedId, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        //   backgroundColor: Colors.blue
        // ),
        //primarySwatch: Colors.yellow,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: HexColor('333739'),
        appBarTheme: AppBarTheme(
          backgroundColor: HexColor('333739'),
          elevation: 0.0,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
      ),
      themeMode: ThemeMode.light,
      //themeMode: AppCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
      debugShowCheckedModeBanner: false,
      //home: savedId != null ? HomeScreen_2(savedId) : loginScreen(),
      home:  loginScreen() ,
    );
  }
}
