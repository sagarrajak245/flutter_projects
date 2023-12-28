import 'package:flutter/material.dart';
import 'package:flutter_first/result.dart';
import 'package:flutter_first/models/data.dart';
//import 'package:flutter_first/models/question.dart';
import 'package:flutter_first/models/answer.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'diceroller.dart';

//orginal code of sagar
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var currentQuestionIndex = 0;
  void createQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      currentQuestionIndex++;
    }
    if (currentQuestionIndex == questions.length - 1) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultSc(choseanswer: selectedAnswer),
          ));
    }
  }

  void previousQuestion() {
    if (currentQuestionIndex == 0) {
      Navigator.pop(context);
    } else {
      currentQuestionIndex--;
    }
  }

  final List<String> selectedAnswer = [];

  void chosenans(String answer) {
    selectedAnswer.add(answer);
  }

  @override
  Widget build(BuildContext context) {
    var questionIndex = questions[currentQuestionIndex];

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(146, 22, 20, 20),
                Color.fromARGB(255, 75, 9, 54),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                questionIndex.text,
                style: GoogleFonts.tiltPrism(
                  textStyle: const TextStyle(
                    backgroundColor: Color.fromARGB(219, 115, 236, 226),
                    color: Color.fromARGB(255, 7, 0, 0),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ...questionIndex.getshuffledanswers().map((answer) {
                return AnsBtn(
                  ansText: answer,
                  onTap: () {
                    chosenans(answer);
                  },
                );
              }).toList(),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  createQuestion();
                  setState(() {});
                },
                child: const Text('Next Question'),
              ),
              ElevatedButton(
                onPressed: () {
                  previousQuestion();
                  setState(() {});
                },
                child: const Text('previous screen '),
              )
            ],
          ),
        ),
      ),
    );
  }
}
