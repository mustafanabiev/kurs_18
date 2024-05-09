class QuizModel {
  QuizModel(this.question, this.answer);

  final String question;
  final bool answer;
}

final q1 = QuizModel('Кыргызстанда 7 область бар', true);
final q2 = QuizModel('Машинанын 5 донгологу бар', false);
final q3 = QuizModel('Кыргызстанда 32 шаар бар', true);
final q4 = QuizModel('Кыргызстандын борбору Баткен', false);
final q5 = QuizModel(
  'Flutter был кроссплатформалык разработкага колдонулат',
  true,
);
final q6 = QuizModel(
  'Dart программалоо тили яндекс компаниясы тарабынан тузулгон',
  false,
);
final q7 = QuizModel('Акжол Махмудов футболист', false);
final q8 = QuizModel('Бир жылда 365 кун бар', true);

List<QuizModel> quizzes = [q1, q2, q3, q4, q5, q6, q7, q8];
