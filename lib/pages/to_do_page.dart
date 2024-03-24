import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

// Define a class to hold the timer state
class TimerState extends ChangeNotifier {
  Timer? _timer;
  late int _hours;
  late int _minutes;
  late int _seconds;
  bool _isPaused = false;

  // Getters for accessing timer state
  int get hours => _hours;
  int get minutes => _minutes;
  int get seconds => _seconds;
  bool get isPaused => _isPaused;

  // Method to start the timer
  void startTimer(int minutes) {
    int seconds = minutes * 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (!_isPaused) {
        if (seconds > 0) {
          seconds--;
          _hours = seconds ~/ 3600;
          _minutes = (seconds % 3600) ~/ 60;
          _seconds = seconds % 60;
        } else {
          _timer?.cancel();
        }
        notifyListeners(); // Notify listeners of state change
      }
    });
  }

  // Method to pause the timer
  void pauseTimer() {
    _isPaused = true;
    notifyListeners(); // Notify listeners of state change
  }

  // Method to resume the timer
  void resumeTimer() {
    _isPaused = false;
    notifyListeners(); // Notify listeners of state change
  }

  // Method to reset and replay the timer
  void replayTimer(int minutes) {
    _isPaused = false;
    startTimer(minutes);
  }

  // Method to dispose the timer when not needed
  void disposeTimer() {
    _timer?.cancel();
  }
}

class PomoPage extends StatelessWidget {
  const PomoPage({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TimerState(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pomodoro Timer'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Consumer<TimerState>(
                builder: (context, timerState, _) {
                  return Column(
                    children: [
                      SizedBox(height: 18),
                      Text(
                        '${timerState.hours} h ${timerState.minutes} m ${timerState.seconds} s left',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () => timerState.pauseTimer(),
                            icon: Icon(Icons.pause),
                            iconSize: 48,
                          ),
                          IconButton(
                            onPressed: () => timerState.resumeTimer(),
                            icon: Icon(Icons.play_arrow),
                            iconSize: 48,
                          ),
                          IconButton(
                            onPressed: () => timerState.replayTimer(25),
                            icon: Icon(Icons.replay),
                            iconSize: 48,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: GridView.count(
                crossAxisCount: 3,
                children: [
                  _buildTimeOption(context, 5),
                  _buildTimeOption(context, 15),
                  _buildTimeOption(context, 30),
                  _buildTimeOption(context, 60),
                  _buildTimeOption(context, 90),
                  _buildTimeOption(context, 120),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeOption(BuildContext context, int minutes) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          final timerState = Provider.of<TimerState>(context, listen: false);
          timerState.startTimer(minutes);
        },
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.deepPurple,
          ),
          child: Center(
            child: Text(
              '$minutes min',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PomoPage(),
  ));
}
