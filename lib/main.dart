import 'package:flutter/material.dart';
import 'dart:math';
import 'dice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      home: const DiceScreen(),
    );
  }
}

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int leftDice = 1;
  int rightDice = 1;
  int total = 2;
  String imagePath = 'assets/sad.png';
  String gameMessage = 'You Lose';

  void rollDice() {
    setState(() {
      leftDice = Random().nextInt(6) + 1;
      rightDice = Random().nextInt(6) + 1;
      total = leftDice + rightDice;

      if (total > 10) {
        imagePath = 'assets/happy.png';
        gameMessage = 'You Win';
      } else {
        imagePath = 'assets/sad.png';
        gameMessage = 'You Lose';
      }
    });
  }

  void resetGame() {
    setState(() {
      leftDice = 1;
      rightDice = 1;
      total = 2;
      imagePath = 'assets/sad.png';
      gameMessage = 'You Lose';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dice Game'),
        centerTitle: true,
        leading: const Icon(Icons.casino),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total: $total',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Image.asset(
              imagePath,
              height: 150,
              width: 150,
            ),
            const SizedBox(height: 10),
            Text(
              gameMessage,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Dice(diceValue: leftDice),
                Dice(diceValue: rightDice),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: rollDice,
                    child: const Text('Roll'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                      foregroundColor: Colors.white,
                    ),
                    onPressed: resetGame,
                    child: const Text('Reset'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}