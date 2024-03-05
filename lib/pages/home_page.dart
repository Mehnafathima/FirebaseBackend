import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Lottie.asset(
          'assets/lottie/cat.json',
          height: MediaQuery.of(context).size.height * 0.05,
        ),
      ),
      body: Center(child: Lottie.asset('assets/lottie/cat.json')),
    );
  }
}
