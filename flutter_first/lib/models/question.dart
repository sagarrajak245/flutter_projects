class Question {
  const Question(this.text, this.answer);

  final String text;
  final List<String> answer;
  List<String> getshuffledanswers() {
    final shuffledanswers = List.of(answer);
    shuffledanswers.shuffle();
    return shuffledanswers;
  }
}
