import 'package:flutter/material.dart';
import 'package:login_authentication/components/bottom_nav_bar.dart';
import 'package:login_authentication/pages/note_page.dart';
import 'package:login_authentication/pages/to_do_page.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void navigateBottomBar(int index){
    setState(() {
          _selectedIndex = index;
    });
  }
  final List<Widget> _pages = [
  const NotePage(),
   const PomoPage(),
  ];
   final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[100],
      appBar: AppBar(
      // backgroundColor: Colors.deepPurple[300],
      elevation: 0,
        leading: Lottie.asset(
          'assets/lottie/cat.json',
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        title: const Center(child: Text("FIX IT")),
        actions: [
          IconButton(
            color: Colors.deepPurple,
            icon: const Icon(Icons.logout),
            onPressed: signUserOut, // Call the logout function when tapped
          ),
        ],
      ),
      bottomNavigationBar:  BottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
