import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Dice  App',
      home: DicePage(),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceValue() {
    setState(() {
      rightDiceNumber = Random().nextInt(6) + 1;
      leftDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: leftDiceNumber == rightDiceNumber ? Colors.green : Colors.white70,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                width: double.infinity,
                height: 50,
                padding: EdgeInsets.all(10),
                child: const Text(
                  "Dicee App",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              Container(
                height: 600,
                width: double.infinity,
                child: Center(
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: InkWell(
                            onTap: changeDiceValue,
                            child: Image(
                              image:
                                  AssetImage("images/dice$leftDiceNumber.png"),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: InkWell(
                            onTap: changeDiceValue,
                            child: Image(
                              image:
                                  AssetImage("images/dice$rightDiceNumber.png"),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
