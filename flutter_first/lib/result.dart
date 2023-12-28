import 'package:flutter/material.dart';

import 'package:flutter_first/models/data.dart';

import 'package:flutter_first/summary.dart';

class ResultSc extends StatelessWidget {
  const ResultSc({super.key, required this.choseanswer});
  final List<String> choseanswer;

  List<Map<String, Object>> getresult() {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < choseanswer.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "answer_of_question": questions[i].answer[0],
        'chosenanswer': choseanswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final sum = getresult();
    final totalque = questions.length;
    final correct = sum.where((data) {
      return data["answer_of_question"] == data["chosenanswer"];
    }).length;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 84, 3, 190),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Text(
                  "Your Score is $correct out of $totalque",
                  style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 150, 179, 77),
                    backgroundColor: Color.fromARGB(255, 3, 8, 0),
                  ),
                ),
                const SizedBox(height: 30),
                Summary(getresult()),
                const SizedBox(height: 30),
                TextButton(
                  onPressed: () {},
                  child: const Text("restartquiz"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
