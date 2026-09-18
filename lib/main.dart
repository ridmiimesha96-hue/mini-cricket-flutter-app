import 'package:flutter/material.dart';

import 'dart:math';

void main() {
  runApp(const MiniCricketApp());
}

class MiniCricketApp extends StatelessWidget {
  const MiniCricketApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Cricket',
      home: const CricketGamePage(),
    );
  }
}

class CricketGamePage extends StatefulWidget {
  const CricketGamePage({super.key});

  @override
  State<CricketGamePage> createState() => _CricketGamePageState();
}

class _CricketGamePageState extends State<CricketGamePage> {
  final Random random = Random();

  int totalRuns = 0;
  int ballsLeft = 6;
  int lastRuns = 0;

  void playBall() {
    if (ballsLeft > 0) {
      int runs = random.nextInt(6) + 1;

      setState(() {
        lastRuns = runs;
        totalRuns = totalRuns + runs;
        ballsLeft = ballsLeft - 1;
      });
    }
  }

  void restartGame() {
    setState(() {
      totalRuns = 0;
      ballsLeft = 6;
      lastRuns = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool gameOver = ballsLeft == 0;

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Mini Cricket'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: 140,
                      height: 140,
                      color: Colors.white,
                      child: Image.asset(
                        'assets/images/cricket_bat.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 10),

                    const Text(
                      'Runs',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),

                    Text(
                      '$totalRuns',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20),

                Column(
                  children: [
                    Container(
                      width: 140,
                      height: 140,
                      color: Colors.white,
                      child: Image.asset(
                        'assets/images/cricket_ball.png',
                        fit: BoxFit.contain,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      'Balls',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),

                    Text(
                      '$ballsLeft',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),

            Text(
              lastRuns == 0 ? 'Press BAT to start' : '$lastRuns Runs',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: ballsLeft == 0 ? restartGame : playBall,
              style: ElevatedButton.styleFrom(
                backgroundColor: ballsLeft == 0
                    ? Colors.red
                    : Colors.blueAccent,
                foregroundColor: Colors.white,
              ),
              child: Text(ballsLeft == 0 ? 'RESTART' : 'BAT'),
            ),
          ], // Column
        ),
      ), // Center
    ); // Scaffold
  }
}
