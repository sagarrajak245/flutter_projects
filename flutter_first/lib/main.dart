import 'package:flutter/material.dart';
import 'package:flutter_first/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GradientContainer(
            color1: Color.fromARGB(247, 7, 7, 7),
            color2: Color.fromARGB(232, 245, 17, 176)),
      ),
    ),
  );
}


/*
void  main (){
runApp(
const materialApp(
homr:scaffold(

  body: gradient 
)



)




)



}



*/