import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  // void Function(int)? onTabChange;
  //  BottomNavBar({super.key, required this.onTabChange});
   final void Function(int)? onTabChange;

  BottomNavBar({super.key, required this.onTabChange}) {
    assert(onTabChange != null, 'onTabChange callback cannot be null');
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      
      child:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: GNav(
        color: Colors.blueGrey[200],
        activeColor: Colors.blueGrey.shade700,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundGradient: const LinearGradient(
            colors: [
              Colors.blueGrey, 
              Colors.deepPurple
              ],
          ),
        tabBackgroundColor: Colors.blueGrey.shade100,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 16,
        onTabChange: (value) => onTabChange!(value),
          tabs: const [
          GButton(
            icon: Icons.access_alarm_outlined,
          text: "Notes",
          textColor: Colors.white38,
          ),
          GButton(
          icon: Icons.headphones,
          text: "Pomodoro",
          textColor: Colors.white38,

          )
        ]
        ),
      ),
    );
  }
}