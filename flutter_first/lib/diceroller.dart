import 'package:flutter/material.dart';
import 'dart:math';
import 'quiz.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var diceroll = 1;

  void rollDice() {
    setState(() {
      diceroll = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          //color: const Color.fromARGB(230, 240, 147, 138),
          'assets/img/dice-$diceroll.png',
          width: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            // padding: const EdgeInsets.only(
            //   top: 20,
            // ),
            foregroundColor: const Color.fromARGB(247, 225, 222, 222),
            textStyle: const TextStyle(fontSize: 28),
          ),
          child: const Text('roll dice'),
        ),
        const SizedBox(
          height: 20,
        ),
        OutlinedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Quiz()),
            );
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            side: const BorderSide(color: Colors.white, width: 2),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          icon: const Icon(Icons.arrow_circle_right, size: 18),
          label: const Text('Go to quiz page'),
        ),
      ],
    );
  }
}
