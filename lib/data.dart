import 'package:quiz/questions.dart';

class Data {
  List<QuestionAndAnswer> _data = [
    QuestionAndAnswer('3 is whole as well as natural number', true),
    QuestionAndAnswer('Force is equal to mass into velocity', true),
    QuestionAndAnswer('Elon Musk is Founder of Microsoft', false),
    QuestionAndAnswer('Jhon Cena is 17 time world champion', false),
    QuestionAndAnswer('Water is found in liquid state', true),
    QuestionAndAnswer('Tissues are basic units of life', false),
  ];

  String getQuestion(int n) {
    return _data[n].question;
  }

  bool getAnswer(int n) {
    return _data[n].answer;
  }

  int length() {
    return _data.length;
  }
}
