import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

// Define a class to hold the timer state
class TimerModel extends ChangeNotifier {
  Timer? _timer;
  late int _hours;
  late int _minutes;
  late int _seconds;
  bool _isPaused = false;
TimerModel() {
    _hours = 0;
    _minutes = 0;
    _seconds = 0;
  }
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
    _hours = 0;
    _minutes = 0;
    _seconds = 0;
    notifyListeners(); // Notify listeners of state change
    startTimer(minutes);
  }

  // Method to dispose the timer when not needed
  void disposeTimer() {
    _timer?.cancel();
  }
}

class PomoPage extends StatefulWidget {
  const PomoPage({Key? key}) : super(key: key);

  @override
  _PomoPageState createState() => _PomoPageState();
}

class _PomoPageState extends State<PomoPage> {
  final TimerModel _timerModel = TimerModel();

  @override
  void dispose() {
    _timerModel.disposeTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Center(child: const Text('Pomodoro')),
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ChangeNotifierProvider(
              create: (context) => _timerModel,
              child: Consumer<TimerModel>(
                builder: (context, timerState, _) {
                  return Column(
                    children: [
                      const SizedBox(height: 18),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: Text(
                          '${timerState.hours} h ${timerState.minutes} m ${timerState.seconds} s left',
                          key: ValueKey<int>(timerState.seconds),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () => _toggleTimer(timerState),
                            icon: Icon(
                              timerState.isPaused
                                  ? Icons.play_arrow
                                  : Icons.pause,
                            ),
                            iconSize: 48,
                          ),
                          IconButton(
                            onPressed: () => timerState.replayTimer(25),
                            icon: const Icon(Icons.replay),
                            iconSize: 48,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.count(
              crossAxisCount: 3,
              // childAspectRatio: 1.1,
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
    );
  }

  Widget _buildTimeOption(BuildContext context, int minutes) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          _timerModel.replayTimer(minutes);
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.deepPurple,
          ),
          child: Center(
            child: Text(
              '$minutes min',
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _toggleTimer(TimerModel timerState) {
    if (timerState.isPaused) {
      timerState.resumeTimer();
    } else {
      timerState.pauseTimer();
    }
  }
}

void main() {
  runApp(const MaterialApp(
    home: PomoPage(),
  ));
}
