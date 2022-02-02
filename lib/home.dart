import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Timer _timer;
  late Timer pauseTime;
  int _countdownTime = 0;
  int parsentController = 1;
  bool isTimerPaused = false;
  bool isTimerRunning = false;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_countdownTime != 0) {
        isTimerRunning = true;
        setState(() {
          _countdownTime = _countdownTime - 1;
        });
      } else {
        setState(() {
          isTimerRunning = false;
        });
        _timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countdown Timer'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // upper time  buttons code............
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //10 sec.....................................................................
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _countdownTime = 10;
                      parsentController = 10;
                    });
                  },
                  child: const Text('10 Sec'),
                ),

                //30 sec.....................................................................
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _countdownTime = 30;
                      parsentController = 30;
                    });
                  },
                  child: const Text('30 Sec'),
                ),

                //60 sec.....................................................................
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _countdownTime = 60;
                      parsentController = 60;
                    });
                  },
                  child: const Text('60 Sec'),
                ),
              ],
            ),

            // midle Count Indicator............
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey[400],
                    color: Colors.green,
                    strokeWidth: 10,
                    value: _countdownTime / parsentController,
                  ),
                ),
                Text(
                  '$_countdownTime',
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
              ],
            ),

            // Start & Pause & Stop buttons code............
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Start Button.........................................................................
                ElevatedButton(
                  onPressed: isTimerRunning ? null : startTimer,
                  child: const Text('Start'),
                ),

                //Pause button..........................................................................
                ElevatedButton(
                  onPressed: isTimerRunning
                      ? () {
                          setState(() {
                            isTimerPaused
                                ? isTimerPaused = false
                                : isTimerPaused = true;
                          });
                          isTimerPaused ? _timer.cancel() : startTimer();
                        }
                      : null,
                  child:
                      isTimerPaused ? const Text('Play') : const Text('Pause'),
                ),

                //stop button..........................................................................
                ElevatedButton(
                  onPressed: () {
                    _timer.cancel();
                    setState(() {
                      _countdownTime = 0;
                      parsentController = 1;
                      isTimerPaused = false;
                      isTimerRunning = false;
                    });
                  },
                  child: const Text('Stop'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
