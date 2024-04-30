import 'package:flutter/material.dart';
import 'dart:math';
import 'package:memorimage_project_uts/class/question.dart';
import 'package:memorimage_project_uts/screen/hasil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:async';

class Game extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GameState();
  }
}

class _GameState extends State<Game> {
  double opacityLevelText = 0.0;
  late Timer _timerText;

  double opacityLevelCardRemember = 0.0;
  late Timer _timerCardRemember;

  int _gameTime = 30;
  int _endGameTime = 0;
  late Timer _timerGame;
  int _point = 0;

  String formatTime(int hitung) {
    var hours = (hitung ~/ 3600).toString().padLeft(2, '0');
    var minutes = ((hitung % 3600) ~/ 60).toString().padLeft(2, '0');
    var seconds = (hitung % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }

  List<QuestionObj> _questions = [];
  List<QuestionObj> _selected_questions = [];
  int _question_no = 0;

  bool _textDeleted = true;
  bool _gapDeleted = true;
  bool _cardDeleted = true;

  bool _percentCreated = false;
  bool _textCreated = false;
  bool _gapCreated = true;
  bool _cardCreated = false;

  @override
  void initState() {
    super.initState();

    _timerText = Timer(Duration(seconds: 1), () {
      _changeOpacityText();
    });

    _timerCardRemember = Timer(Duration(seconds: 3), () {
      _changeOpacityCardRemember();
    });

    int randomIndex1 = Random().nextInt(3);
    String randomImage1 = "assets/images/c-1-${randomIndex1 + 1}.png";
    _questions.add(QuestionObj(
      "assets/images/c-1-1.png",
      "assets/images/c-1-2.png",
      "assets/images/c-1-3.png",
      "assets/images/c-1-4.png",
      randomImage1,
    ));
    int randomIndex2 = Random().nextInt(3);
    String randomImage2 = "assets/images/c-2-${randomIndex2 + 1}.png";
    _questions.add(QuestionObj(
      "assets/images/c-2-1.png",
      "assets/images/c-2-2.png",
      "assets/images/c-2-3.png",
      "assets/images/c-2-4.png",
      randomImage2,
    ));
    int randomIndex3 = Random().nextInt(3);
    String randomImage3 = "assets/images/c-3-${randomIndex3 + 1}.png";
    _questions.add(QuestionObj(
        "assets/images/c-3-1.png",
        "assets/images/c-3-2.png",
        "assets/images/c-3-3.png",
        "assets/images/c-3-4.png",
        randomImage3));
    int randomIndex4 = Random().nextInt(3);
    String randomImage4 = "assets/images/c-4-${randomIndex4 + 1}.png";
    _questions.add(QuestionObj(
        "assets/images/c-4-1.png",
        "assets/images/c-4-2.png",
        "assets/images/c-4-3.png",
        "assets/images/c-4-4.png",
        randomImage4));
    int randomIndex5 = Random().nextInt(3);
    String randomImage5 = "assets/images/c-5-${randomIndex5 + 1}.png";
    _questions.add(QuestionObj(
        "assets/images/c-5-1.png",
        "assets/images/c-5-2.png",
        "assets/images/c-5-3.png",
        "assets/images/c-5-4.png",
        randomImage5));
    int randomIndex6 = Random().nextInt(3);
    String randomImage6 = "assets/images/c-6-${randomIndex6 + 1}.png";
    _questions.add(QuestionObj(
        "assets/images/c-6-1.png",
        "assets/images/c-6-2.png",
        "assets/images/c-6-3.png",
        "assets/images/c-6-4.png",
        randomImage6));
    int randomIndex7 = Random().nextInt(3);
    String randomImage7 = "assets/images/c-7-${randomIndex7 + 1}.png";
    _questions.add(QuestionObj(
        "assets/images/c-7-1.png",
        "assets/images/c-7-2.png",
        "assets/images/c-7-3.png",
        "assets/images/c-7-4.png",
        randomImage7));
    int randomIndex8 = Random().nextInt(3);
    String randomImage8 = "assets/images/c-8-${randomIndex8 + 1}.png";
    _questions.add(QuestionObj(
        "assets/images/c-8-1.png",
        "assets/images/c-8-2.png",
        "assets/images/c-8-3.png",
        "assets/images/c-8-4.png",
        randomImage8));
    int randomIndex9 = Random().nextInt(3);
    String randomImage9 = "assets/images/c-9-${randomIndex9 + 1}.png";
    _questions.add(QuestionObj(
        "assets/images/c-9-1.png",
        "assets/images/c-9-2.png",
        "assets/images/c-9-3.png",
        "assets/images/c-9-4.png",
        randomImage9));
    int randomIndex10 = Random().nextInt(3);
    String randomImage10 = "assets/images/c-10-${randomIndex10 + 1}.png";
    _questions.add(QuestionObj(
        "assets/images/c-10-1.png",
        "assets/images/c-10-2.png",
        "assets/images/c-10-3.png",
        "assets/images/c-10-4.png",
        randomImage10));
    int randomIndex11 = Random().nextInt(3);
    String randomImage11 = "assets/images/c-11-${randomIndex11 + 1}.png";
    _questions.add(QuestionObj(
        "assets/images/c-11-1.png",
        "assets/images/c-11-2.png",
        "assets/images/c-11-3.png",
        "assets/images/c-11-4.png",
        randomImage11));
    int randomIndex12 = Random().nextInt(3);
    String randomImage12 = "assets/images/c-12-${randomIndex12 + 1}.png";
    _questions.add(QuestionObj(
        "assets/images/c-12-1.png",
        "assets/images/c-12-2.png",
        "assets/images/c-12-3.png",
        "assets/images/c-12-4.png",
        randomImage12));
    int randomIndex13 = Random().nextInt(3);
    String randomImage13 = "assets/images/c-13-${randomIndex13 + 1}.png";
    _questions.add(QuestionObj(
        "assets/images/c-13-1.png",
        "assets/images/c-13-2.png",
        "assets/images/c-13-3.png",
        "assets/images/c-13-4.png",
        randomImage13));
    int randomIndex14 = Random().nextInt(3);
    String randomImage14 = "assets/images/c-14-${randomIndex14 + 1}.png";
    _questions.add(QuestionObj(
        "assets/images/c-14-1.png",
        "assets/images/c-14-2.png",
        "assets/images/c-14-3.png",
        "assets/images/c-14-4.png",
        randomImage14));
    int randomIndex15 = Random().nextInt(3);
    String randomImage15 = "assets/images/c-15-${randomIndex15 + 1}.png";
    _questions.add(QuestionObj(
        "assets/images/c-15-1.png",
        "assets/images/c-15-2.png",
        "assets/images/c-15-3.png",
        "assets/images/c-15-4.png",
        randomImage15));
    int randomIndex16 = Random().nextInt(3);
    String randomImage16 = "assets/images/c-16-${randomIndex16 + 1}.png";
    _questions.add(QuestionObj(
        "assets/images/c-16-1.png",
        "assets/images/c-16-2.png",
        "assets/images/c-16-3.png",
        "assets/images/c-16-4.png",
        randomImage16));
    int randomIndex17 = Random().nextInt(3);
    String randomImage17 = "assets/images/c-17-${randomIndex17 + 1}.png";
    _questions.add(QuestionObj(
        "assets/images/c-17-1.png",
        "assets/images/c-17-2.png",
        "assets/images/c-17-3.png",
        "assets/images/c-17-4.png",
        randomImage17));
    int randomIndex18 = Random().nextInt(3);
    String randomImage18 = "assets/images/c-10-${randomIndex18 + 1}.png";
    _questions.add(QuestionObj(
        "assets/images/c-18-1.png",
        "assets/images/c-18-2.png",
        "assets/images/c-18-3.png",
        "assets/images/c-18-4.png",
        randomImage18));
    int randomIndex19 = Random().nextInt(3);
    String randomImage19 = "assets/images/c-19-${randomIndex19 + 1}.png";
    _questions.add(QuestionObj(
        "assets/images/c-19-1.png",
        "assets/images/c-19-2.png",
        "assets/images/c-19-3.png",
        "assets/images/c-19-4.png",
        randomImage19));
    int randomIndex20 = Random().nextInt(3);
    String randomImage20 = "assets/images/c-20-${randomIndex20 + 1}.png";
    _questions.add(QuestionObj(
        "assets/images/c-20-1.png",
        "assets/images/c-20-2.png",
        "assets/images/c-20-3.png",
        "assets/images/c-20-4.png",
        randomImage20));

    Set<int> uniqueNumbers = Set<int>();
    Random random = Random();

    while (uniqueNumbers.length < 5) {
      uniqueNumbers.add(random.nextInt(19));
    }

    List<int> randomNumbers = uniqueNumbers.toList();

    for (int num in randomNumbers) {
      _selected_questions.add(_questions[num]);
      print(num+1);
    }
  }

  void _changeOpacityText() {
    setState(() {
      opacityLevelText = opacityLevelText == 0 ? 1.0 : 0.0;

      if (opacityLevelText == 1.0) {
        _timerText = Timer(Duration(seconds: 11), () {
          _changeOpacityText();
        });
      }
    });
  }

  void _changeOpacityCardRemember() {
    setState(() {
      opacityLevelCardRemember = opacityLevelCardRemember == 0 ? 1.0 : 0.0;

      if (opacityLevelCardRemember == 1.0) {
        _timerCardRemember = Timer(Duration(seconds: 1), () {
          _changeOpacityCardRemember();
        });
      } else {
        if (_question_no < _selected_questions.length - 1) {
          _timerCardRemember = Timer(Duration(seconds: 1), () {
            _question_no++;
            _changeOpacityCardRemember();
          });
        } else {
          _timerCardRemember.cancel();

          Timer(Duration(seconds: 1), () {
            setState(() {
              _textDeleted = false;
              _gapDeleted = false;
              _cardDeleted = false;

              _percentCreated = true;
              _textCreated = true;
              _gapCreated = true;
              _cardCreated = true;
              _question_no = 0;

              startGameTimer();
            });
          });
        }
      }
    });
  }

  startGameTimer() {
    _endGameTime = _gameTime;
    _timerGame = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _endGameTime--;
        if (_endGameTime == 0) {
          _question_no++;

          if (_question_no > _selected_questions.length - 1) finishQuiz();
          _endGameTime = _gameTime;
        }
      });
    });
  }

  finishQuiz() {
    _timerGame.cancel();
    _question_no = 0;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Hasil(_point)),
    );
  }

  void checkAnswer(String answer) {
    setState(() {
      if (answer == _selected_questions[_question_no].answer) {
        _point += 1;
      }
      _question_no++;
      if (_question_no > _selected_questions.length - 1) finishQuiz();
      _endGameTime = _gameTime;
    });
  }

  @override
  void dispose() {
    _timerText.cancel();
    _timerCardRemember.cancel();
    _timerGame.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Visibility(
              visible: _textDeleted,
              child: Container(
                alignment: Alignment.topCenter,
                child: AnimatedOpacity(
                  opacity: opacityLevelText,
                  duration: const Duration(seconds: 1),
                  child: Text(
                    "Remember This Card",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Visibility(visible: _gapDeleted, child: SizedBox(height: 30)),
            Visibility(
              visible: _cardDeleted,
              child: AnimatedOpacity(
                opacity: opacityLevelCardRemember,
                duration: const Duration(seconds: 1),
                child: Container(
                  width: 200,
                  height: 300,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 219, 251),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                      image: DecorationImage(
                          image: AssetImage(
                              _selected_questions[_question_no].answer),
                          fit: BoxFit.fitWidth)),
                ),
              ),
            ),
            Visibility(
              visible: _percentCreated,
              child: LinearPercentIndicator(
                  center: Text(formatTime(_endGameTime)),
                  width: MediaQuery.of(context).size.width,
                  lineHeight: 20.0,
                  percent: 1 - (_endGameTime / _gameTime),
                  backgroundColor: Colors.green,
                  progressColor: Colors.red),
            ),
            Visibility(visible: _gapCreated, child: SizedBox(height: 30)),
            Visibility(
                visible: _textCreated,
                child: Container(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Which card have you seen before?",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ))),
            Visibility(visible: _gapCreated, child: SizedBox(height: 30)),
            Visibility(
              visible: _cardCreated,
              child: Container(
                height: 660,
                child: GridView.count(crossAxisCount: 2, children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(40, 0, 40, 30),
                      child: TextButton(
                          onPressed: () {
                            checkAnswer(
                                _selected_questions[_question_no].option_a);
                          },
                          child: Container(
                            width: 200,
                            height: 330,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 219, 251),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                              image: DecorationImage(
                                image: AssetImage(
                                    _selected_questions[_question_no].option_a),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ))),
                  Padding(
                      padding: EdgeInsets.fromLTRB(40, 0, 40, 30),
                      child: TextButton(
                          onPressed: () {
                            checkAnswer(
                                _selected_questions[_question_no].option_b);
                          },
                          child: Container(
                            width: 200,
                            height: 330,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 219, 251),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                                image: DecorationImage(
                                    image: AssetImage(
                                        _selected_questions[_question_no]
                                            .option_b),
                                    fit: BoxFit.fitWidth)),
                          ))),
                  Padding(
                      padding: EdgeInsets.fromLTRB(40, 30, 40, 0),
                      child: TextButton(
                          onPressed: () {
                            checkAnswer(
                                _selected_questions[_question_no].option_c);
                          },
                          child: Container(
                            width: 200,
                            height: 330,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 219, 251),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                                image: DecorationImage(
                                    image: AssetImage(
                                        _selected_questions[_question_no]
                                            .option_c),
                                    fit: BoxFit.fitWidth)),
                          ))),
                  Padding(
                      padding: EdgeInsets.fromLTRB(40, 30, 40, 0),
                      child: TextButton(
                          onPressed: () {
                            checkAnswer(
                                _selected_questions[_question_no].option_d);
                          },
                          child: Container(
                            width: 200,
                            height: 330,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 219, 251),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                                image: DecorationImage(
                                    image: AssetImage(
                                        _selected_questions[_question_no]
                                            .option_d),
                                    fit: BoxFit.fitWidth)),
                          ))),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
