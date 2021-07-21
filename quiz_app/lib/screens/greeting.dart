import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/screens/question_page.dart';
import 'package:delayed_display/delayed_display.dart';




class Greeting extends StatefulWidget {
  const Greeting({Key? key}) : super(key: key);

  @override
  _GreetingState createState() => _GreetingState();
}

class _GreetingState extends State<Greeting> {
  bool isTextFinished = false;
  bool isImageFinished = false;

  double _margin = 0;

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 100.0),
          Padding(
              padding: const EdgeInsets.all(30.0),
              child: DefaultTextStyle(
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'Yeseva',
                  color: Colors.white,
                ),
                child: AnimatedTextKit(
                  onFinished: (){
                    isTextFinished = true;
                  },
                  totalRepeatCount: 1,
                  animatedTexts: [
                    TypewriterAnimatedText('Your guide to personality_'),
                  ],
                ),
              ),
            ),
            DelayedDisplay(
              delay: Duration(seconds: 1),
              fadingDuration: Duration(seconds: 2),
              slidingCurve: Curves.easeInOutCirc,
              child: Container(
                width: 300,
                height: 300,
                child: Image(
                    image: AssetImage('assets/personality.png')
                ),
              ),
            ),
          SizedBox(height: 90.0),
          DelayedDisplay(
            delay: Duration(seconds: 3),
            child: BouncingWidget(
              duration: Duration(milliseconds: 100),
              scaleFactor: 1.5,
              onPressed: () {
                print("onPressed");
              },
              child: RawMaterialButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionPage()));
                },
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.purple,
                    width: 4,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                fillColor: Colors.white,
                elevation: 4,
                splashColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 60, top: 15, right: 60, bottom: 15),
                  child: Text("Start quiz",
                    style: TextStyle(
                      color: Colors.purple,
                      fontFamily: 'Yeseva',
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // AnimatedContainer(
          //     duration: Duration(seconds: 1),
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('assets/knowledge.png'),
          //       alignment: Alignment.center,
          //     ),
          //   ),
          //   onEnd:(){
          //       isImageFinished= true;
          //   }
          // ),
        ],
      ),
    );
  }
}
