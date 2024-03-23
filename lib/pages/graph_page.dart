// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class TimerState {
//   bool isPaused = false;
//   int hours = 0;
//   int minutes = 0;
//   int seconds = 0;
// }

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => TimerState(),
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: PomoPage(),
//     );
//   }
// }

// class PomoPage extends StatelessWidget {
//   const PomoPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final timerState = Provider.of<TimerState>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pomodoro Timer'),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           // Timer and control buttons
//           Expanded(
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     '${timerState.hours}h ${timerState.minutes}m ${timerState.seconds}s left',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       IconButton(
//                         onPressed: () {
//                           // Implement pause functionality
//                         },
//                         icon: Icon(Icons.pause),
//                         iconSize: 48,
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           // Implement play/resume functionality
//                         },
//                         icon: Icon(Icons.play_arrow),
//                         iconSize: 48,
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           // Implement replay functionality
//                         },
//                         icon: Icon(Icons.replay),
//                         iconSize: 48,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // Time interval options
//           GridView.count(
//             crossAxisCount: 3,
//             shrinkWrap: true,
//             children: [
//               _buildTimeOption(context, 5),
//               _buildTimeOption(context, 15),
//               _buildTimeOption(context, 30),
//               _buildTimeOption(context, 60),
//               _buildTimeOption(context, 90),
//               _buildTimeOption(context, 120),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTimeOption(BuildContext context, int minutes) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: InkWell(
//         onTap: () {
//           // Implement logic to start timer for selected duration
//         },
//         child: Container(
//           padding: EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: Colors.deepPurple,
//           ),
//           child: Center(
//             child: Text(
//               '$minutes min',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
