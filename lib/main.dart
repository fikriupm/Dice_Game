import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Home(), debugShowCheckedModeBanner: false));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int leftDiceValue = 1;
  int rightDiceValue = 1;

  void rollDice() {
    setState(() {
      leftDiceValue = Random().nextInt(6) + 1;
      rightDiceValue = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF43782B),
      appBar: AppBar(
        title: const Text("Dice Game"),
        centerTitle: true,
        backgroundColor: const Color(0xFF721414),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset('assets/images/lasvegas.jpeg'),
              Row(
                children: [
                  Expanded(
                    child: Hero(
                      tag: 'leftDice',
                      child: Image.asset("assets/images/dice$leftDiceValue.png"),
                    ),
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
                  Expanded(
                    child: Hero(
                      tag: 'rightDice',
                      child: Image.asset("assets/images/dice$rightDiceValue.png"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 114, 15, 15), foregroundColor: Colors.yellow, fixedSize: const Size(140, 40)),
                onPressed: rollDice,
                child: const Text("Button"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
