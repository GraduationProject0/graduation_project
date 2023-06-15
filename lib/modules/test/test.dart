// import 'package:flutter/material.dart';
//
// class test extends StatelessWidget {
//   const test({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           Row(
//             children: [
//               InkWell(
//                 onTap: (){
//
//                 },
//                 child: Container(
//                   child: Text('dddd'),
//                 ),
//               ),
//               SizedBox(
//                 width: 15.0,
//               ),
//               InkWell(
//                 onTap: (){
//
//                 },
//                 child: Container(
//                   child: Text('sdsd'),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 15.0,
//           ),
//           InkWell(
//             onTap: (){
//
//             },
//             child: Container(
//               child: Text('dddd'),
//             ),
//           ),
//           SizedBox(
//             width: 15.0,
//           ),
//           InkWell(
//             onTap: (){
//
//             },
//             child: Container(
//               child: Text('dddd'),
//             ),
//           ),
//           SizedBox(
//             width: 15.0,
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   bool isDarkMode = false;
//   SharedPreferences prefs;
//
//   @override
//   void initState() {
//     super.initState();
//     initSharedPreferences();
//   }
//
//   void initSharedPreferences() async {
//     prefs = await SharedPreferences.getInstance();
//     bool storedMode = prefs.getBool('isDarkMode') ?? false;
//     setState(() {
//       isDarkMode = storedMode;
//     });
//   }
//
//   void toggleTheme() {
//     setState(() {
//       isDarkMode = !isDarkMode;
//     });
//     prefs.setBool('isDarkMode', isDarkMode);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Light and Dark Mode'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Switch(
//                 value: isDarkMode,
//                 onChanged: (value) => toggleTheme(),
//               ),
//               Text(
//                 isDarkMode ? 'Dark Mode' : 'Light Mode',
//                 style: TextStyle(fontSize: 24),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

