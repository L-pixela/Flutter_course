import '../model/quiz.dart';

Question q1 = const Question(
    title: "Who is the best teacher?",
    possibleAnswers: ["ronan", "hongly", 'leangsiv'],
    goodAnswer: 'ronan');
Question q2 = const Question(
    title: "What is Flutter?",
    possibleAnswers: ["Framework", "Programming Language", 'App', "Website"],
    goodAnswer: 'Website');
Question q3 = const Question(
    title: "Who created Tesla?",
    possibleAnswers: ["Elon Musk", "Elong Ma", 'Mask Elon', "Nicolas Tesla"],
    goodAnswer: 'Elong Ma');
Question q4 = const Question(
    title: "Where is Cambodia?",
    possibleAnswers: ["Europe", "Asia", 'North America', 'South America'],
    goodAnswer: 'Asia');
Question q5 = const Question(
    title: "Where is the capital of Cambodia?",
    possibleAnswers: ["Phnom Penh", "Tokyo", 'Bangkok', "Seoul"],
    goodAnswer: 'Phnom Penh');
Question q6 = const Question(
    title: "How to improve your skills?",
    possibleAnswers: ["Sleep", "Practice", 'Run'],
    goodAnswer: 'Run');
Question q16 = const Question(
    title: "What is the capital of France?",
    possibleAnswers: ["Berlin", "Madrid", "Paris", "Rome"],
    goodAnswer: "Paris");

Question q17 = const Question(
    title: "Which planet is known as the Red Planet?",
    possibleAnswers: ["Earth", "Mars", "Jupiter", "Venus"],
    goodAnswer: "Mars");

Question q18 = const Question(
    title: "What is the largest ocean on Earth?",
    possibleAnswers: ["Atlantic", "Indian", "Arctic", "Pacific"],
    goodAnswer: "Pacific");

Question q19 = const Question(
    title: "Who wrote 'Romeo and Juliet'?",
    possibleAnswers: [
      "Charles Dickens",
      "William Shakespeare",
      "Mark Twain",
      "Jane Austen"
    ],
    goodAnswer: "William Shakespeare");

Question q20 = const Question(
    title: "What is the chemical symbol for water?",
    possibleAnswers: ["O2", "H2O", "CO2", "NaCl"],
    goodAnswer: "H2O");

Question q21 = const Question(
    title: "Which country is known as the Land of the Rising Sun?",
    possibleAnswers: ["China", "Japan", "Thailand", "India"],
    goodAnswer: "Japan");

Question q7 = const Question(
    title: "What is the hardest natural substance on Earth?",
    possibleAnswers: ["Gold", "Iron", "Diamond", "Platinum"],
    goodAnswer: "Diamond");

Question q8 = const Question(
    title: "Who painted the Mona Lisa?",
    possibleAnswers: [
      "Vincent van Gogh",
      "Pablo Picasso",
      "Leonardo da Vinci",
      "Claude Monet"
    ],
    goodAnswer: "Leonardo da Vinci");

Question q9 = const Question(
    title: "What is the smallest prime number?",
    possibleAnswers: ["0", "1", "2", "3"],
    goodAnswer: "2");

Question q10 = const Question(
    title: "Which element has the atomic number 1?",
    possibleAnswers: ["Helium", "Oxygen", "Hydrogen", "Carbon"],
    goodAnswer: "Hydrogen");

Question q11 = const Question(
    title: "What is the capital city of Australia?",
    possibleAnswers: ["Sydney", "Melbourne", "Canberra", "Brisbane"],
    goodAnswer: "Canberra");

Question q12 = const Question(
    title: "Which planet is closest to the sun?",
    possibleAnswers: ["Venus", "Earth", "Mercury", "Mars"],
    goodAnswer: "Mercury");

Question q13 = const Question(
    title: "What is the largest mammal in the world?",
    possibleAnswers: ["Elephant", "Blue Whale", "Giraffe", "Great White Shark"],
    goodAnswer: "Blue Whale");

Question q14 = const Question(
    title: "Who discovered penicillin?",
    possibleAnswers: [
      "Marie Curie",
      "Alexander Fleming",
      "Isaac Newton",
      "Albert Einstein"
    ],
    goodAnswer: "Alexander Fleming");

Question q15 = const Question(
    title: "What is the main ingredient in guacamole?",
    possibleAnswers: ["Tomato", "Avocado", "Onion", "Pepper"],
    goodAnswer: "Avocado");

List<Question> myQuestions = [
  q1,
  q2,
  q3,
  q4,
  q5,
  q6,
  q7,
  q8,
  q9,
  q10,
  q11,
  q12,
  q13,
  q14,
  q15,
  q16,
  q17,
  q18,
  q19,
  q20,
  q21
];

Quiz myQuiz = Quiz(title: "Crazy Quizz", questions: myQuestions);
