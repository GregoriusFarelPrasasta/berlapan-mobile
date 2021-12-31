import 'package:flutter/material.dart';
import 'package:berlapan_app/Screens/Welcome/welcome_screen.dart';
import 'package:berlapan_app/Screens/Profilepage/profile_screen.dart';
// import 'package:berlapan_app/Screens/daftar_vaksinasi.dart';

void main() {
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Berlapan App',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Berlapan Mobile Bro'),
//         ),
//         body: SingleChildScrollView(
//             child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Ini mobile app berlapan bro'),
//             Builder(
//                 builder: (context) => ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const DaftarVaksinasi()));
//                     },
//                     child: Text('Daftar Vaksinasi'))),
//           ],
//         )),
//       ),
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Berlapan Mobile',
      theme: ThemeData(
        primaryColor: Colors.green[300],
        scaffoldBackgroundColor: Colors.white,
      ),
      home: ProfilePage(),
    );
  }
}
