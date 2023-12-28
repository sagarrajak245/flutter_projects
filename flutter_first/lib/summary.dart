import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  const Summary(this.summarydata, {Key? key}) : super(key: key);

  final List<Map<String, Object>> summarydata;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: summarydata.map((data) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              data["question"] as String,
              style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 234, 237, 237),
                  backgroundColor: Color.fromARGB(255, 32, 3, 48)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 26),
            Text('your ans is :${data['chosenanswer']}',
                style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 230, 238, 236),
                    backgroundColor: Color.fromARGB(255, 26, 2, 39)),
                textAlign: TextAlign.center),
            Text(
              'correct ans is:${data["answer_of_question"]}',
              style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 243, 246, 245),
                  backgroundColor: Color.fromARGB(255, 27, 3, 40)),
              textAlign: TextAlign.center,
            ),
          ],
        );
      }).toList(),
    );
  }
}
