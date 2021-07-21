import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/screens/result_page.dart';

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {

  List<Question> questionList  = [
    Question(
      questionText: 'How do you get your energy?',
      answerOne: 'By spending time with others since I am sociable, talk a lot, have many friends.',
      answerTwo: 'By spending time alone, because I am quiet, I like listening and prefer deep relationships.',
      resultLetterIfOne: 'E',
      resultLetterIfTwo: 'I'),
    Question(
      questionText: 'How do you see the world & gather information?',
      answerOne: 'I pay attention to details, like practical things, focus on the present.',
      answerTwo: 'I like theories, think in abstract terms, focus on the future.',
      resultLetterIfOne: 'S',
      resultLetterIfTwo: 'N'),
    Question(
      questionText: 'How do you make your decisions?',
      answerOne: 'I mostly use my head, make decisions based on logic, I am scientific in describing the world.',
      answerTwo: 'I mostly use my heart, make decisions based on my values, I am poetic in describing the world.',
      resultLetterIfOne: 'T',
      resultLetterIfTwo: 'F'),
    Question(
        questionText: 'How much do you like to plan ahead?',
        answerOne: 'I am organized and structured, I make plans in advance and stick to them.',
        answerTwo: 'I am casual and relaxed, I am able to change plans quickly and adapt to them.',
        resultLetterIfOne: 'J',
        resultLetterIfTwo: 'P')];

  String resultString = '';
  int index = 0;
  bool isAnswerChosen = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 190.0),
            Container(
              child: DelayedDisplay(
                delay: Duration(milliseconds: 1000),
                fadingDuration: Duration(milliseconds: 500),
                slidingBeginOffset: const Offset(2, 0),
                child: Text(
                questionList[index].questionText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Yeseva',
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.0),
            DelayedDisplay(
              delay: Duration(milliseconds: 2000),
              fadingDuration: Duration(milliseconds: 500),
              slidingBeginOffset: const Offset(-2, 0),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 15),
                child: BouncingWidget(
                  duration: Duration(milliseconds: 100),
                  scaleFactor: 1.5,
                  onPressed: () {
                  },
                  child: RawMaterialButton(
                    onPressed: (){
                      if(index < questionList.length-1){
                        resultString += questionList[index].resultLetterIfOne;
                        index = index + 1;
                        isAnswerChosen = true;
                        print(resultString);
                        setState(() {
                        });
                      }else{
                        resultString += questionList[index].resultLetterIfOne;
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>
                            ResultPage(resultString: resultString)));
                      }

                    },
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.purple,
                        width: 4,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: Colors.white,
                    elevation: 4,
                    splashColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, top: 15, right: 30, bottom: 15),
                      child: Text(questionList[index].answerOne,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.purple,
                          fontFamily: 'Montserrat',
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            DelayedDisplay(
              delay: Duration(milliseconds: 2500),
              fadingDuration: Duration(milliseconds: 500),
              slidingBeginOffset: const Offset(-2, 0),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: BouncingWidget(
                  duration: Duration(milliseconds: 100),
                  scaleFactor: 1.5,
                  onPressed: () {
                  },
                  child: RawMaterialButton(
                    onPressed: (){
                      print(resultString);
                      if(index < questionList.length-1){
                        resultString += questionList[index].resultLetterIfTwo;
                        index = index + 1;
                        isAnswerChosen = true;
                        setState(() {
                        });
                      }else{
                        resultString += questionList[index].resultLetterIfTwo;
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>
                            ResultPage(resultString: resultString)));

                      }

                    },
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.purple,
                        width: 4,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: Colors.white,
                    elevation: 4,
                    splashColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, top: 15, right: 30, bottom: 15),
                      child: Text(questionList[index].answerTwo,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.purple,
                          fontFamily: 'Montserrat',
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
