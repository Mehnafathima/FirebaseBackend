import 'package:flutter/material.dart';
import 'package:login_authentication/pages/auth_page.dart';
// import 'package:login_authentication/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   const MaterialApp(
      //  theme: ThemeData(
      //   primaryColor: Colors.blueGrey[50], // Set your primary color
       
      // ),
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
      
    );
  }
}