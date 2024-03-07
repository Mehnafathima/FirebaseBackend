import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Future<void> logout() async {
  try {
    await FirebaseAuth.instance.signOut();
    // Navigate to login screen or desired post-logout destination
    Navigator.pushReplacementNamed(context, '/login'); // Replace with your route name
  } on FirebaseAuthException catch (e) {
    // Handle potential errors (optional)
    print(e.message); // Log the error message for debugging
    // Display an error message to the user (optional)
  }
}
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Lottie.asset(
          'assets/lottie/cat.json',
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: logout, // Call the logout function when tapped
          ),
        ],
      ),
      body: Center(child: Lottie.asset('assets/lottie/cat.json')),
    );
  }
}
