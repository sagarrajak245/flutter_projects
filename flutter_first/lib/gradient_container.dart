import 'package:flutter/material.dart';
//import 'package:flutter_first/style_text.dart';
import 'package:flutter_first/diceroller.dart';

var startAlignment = Alignment.bottomCenter;
var endAlignment = Alignment.topCenter;

// second way of doing

class GradientContainer extends StatelessWidget {
  const GradientContainer(
      {required this.color1,
      required this.color2,
      super.key}); // named argument

  final Color color1; // can be mutated hence no use of final
  final Color color2;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2], // list of colors
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}










































//class GradientContainer extends StatelessWidget {
//  const GradientContainer({super.key, required this.colors});// named argument
//
//final List <Color> colors;// can be mutated hence no use of final
//
//  @override
//  Widget build(Context) {
//    return Container(
//      decoration: BoxDecoration(
//        gradient: LinearGradient(
//          colors:colors
//         ,
//          begin: startAlignment,
//          end: endAlignment,
//        ),
//      ),
//      child: const Center(
//        child: StyleText(" The sagar rajak tenacious 3.one!"),
//      ),
//    );
//  }
//}
